class YourTeam::Scraper
  # this class should scrape twitter and insert hashtagged results in the db
  def initialize
    @tweets = {}
  end
  attr_accessor :tweets
  
  def get_tweets
    since_id = YourTeam::Scraper::Status.first(:order=>[:created_at.desc])     
    YourTeam.logger.info "Fetching tweets (since_id: #{since_id})"
    url = "http://search.twitter.com/search.json?q=%23yourteam"
    url << "&since_id=#{since_id}" if since_id
    content = Curl::Easy.perform(url) do |curl|
      curl.timeout = 12
    end
    @tweets = JSON.parse(content.body_str)
    YourTeam.logger.info "found #{@tweets['results'].length} tweets. max_id is #{@tweets['max_id']}"
    YourTeam::Scraper::Status.create(:since_id=>@tweets["max_id"])     
  end
  
  def process_tweets
    raise "don't got no tweets to process dog." if self.tweets.empty?
    # so... we shouldn't even do this if there isn't a to_user
    num_tweets = self.tweets['results'].length
    YourTeam.logger.info "Processing #{num_tweets} tweets"
    results = self.tweets["results"]
    results.each do |tweet|
      YourTeam.logger.info "tweet #{results.index(tweet)+1}/#{num_tweets}"
      unless tweet["to_user_id"].nil?
        team_captain = find_or_create_user(tweet["to_user"])
        tagged_by    = find_or_create_user(tweet["from_user"])
        member = YourTeam::Member.create(:text => tweet["text"], :twitter_id=>tweet["id"])
        team_captain.add_member(:member=>member, :tagged_by=>tagged_by)
        YourTeam.logger.info "adding #{member.inspect} to #{team_captain.username}'s team tagged_by #{tagged_by.username}"
        # we need
        # 3. TODO parse text for url and name
        # 4. TODO store source(who's doing this from what platform: iphone, bb, webui)
        # 6. TODO language code
      end
    end
  end
  
  def find_or_create_user(username)
    raise 'username ist erforderlich german for give me a username' unless username
    unless YourTeam::User.first(:username=>username)
      content = Curl::Easy.perform("http://twitter.com/users/show/#{username}.json") do |curl|
        curl.timeout = 12
      end
      user_info = JSON.parse(content.body_str)  
      YourTeam::User.create( :username          => user_info["screen_name"], 
                             :location          => user_info["location"] , 
                             :name              => user_info["name"] , 
                             :profile_image_url => user_info["profile_image_url"], 
                             :twitter_id        => user_info["id"])
    else  
      YourTeam::User.first(:username=>username)
    end
  end
  
  class Status
    include DataMapper::Resource
    property :id, Serial
    property :since_id, String
    property :created_at, DateTime, :default => Proc.new {Time.now}
  end
  
end