class YourTeam::Scraper
  # this class should scrape twitter and insert hashtagged results in the db
  def initialize
    @tweets = {}
  end
  attr_reader :tweets
  
  def get_tweets
    # need to be able to search from the last id stored: http://search.twitter.com/search.atom?q=%23yourteam&since_id=1520639490
    content = Curl::Easy.perform("http://search.twitter.com/search.json?q=%23yourteam") do |curl|
      curl.timeout = 12
    end
    @tweets = JSON.parse(content.body_str)
  end
  
  def process_tweets
    raise "don't got no tweets to process dog." if self.tweets.empty?
    self.tweets["results"].first["from_user"]
    # we need
    # 1. from_user => got get user's info USING USERNAME! tagged_by = User.create(:username=>, :profile_image_url=>)
    # 2. to_user_id => go get that user's info => user = User.create(:username=>)
    # 3. parse text for url and name
    # 4. TODO store source(who's doing this from what platform: iphone, bb, webui)
    # 5. store twitter id
    # 6. TODO language code
  end
  
  def create_user(username)
    raise 'username ist erforderlich deutsch for give me a username' unless username
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
    end
  end
end