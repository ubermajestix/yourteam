
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe "processing twitter data" do
  before(:each) do
    @scraper = YourTeam::Scraper.new
    # load tweets from file instead of web
    @scraper.tweets = JSON.load(File.open("spec/data/twitter.json"))
  end

  it "should parse json and return hash" do
    @get_live_twitter = YourTeam::Scraper.new
    @get_live_twitter.get_tweets
    @get_live_twitter.tweets.should be_kind_of(Hash)
    status = YourTeam::Scraper::Status.first
    status.since_id.should == @get_live_twitter.tweets["max_id"].to_s
  end
  
  it "should raise error processing no tweets" do
    @new_scraper = YourTeam::Scraper.new
    lambda{@new_scraper.process_tweets}.should raise_error("don't got no tweets to process dog.")
  end  
  
  it "should create a member and insert it on a team" do
    result = @scraper.process_tweets
    # given sample data:
    # needs to create 2 users
    # needs to create 2 members
    # members need to be on 2 teams
    YourTeam::User.all.length.should == 2
    YourTeam::Member.all.length.should == 2
    YourTeam::Team.all.length.should == 2
  end
  
  it "should have members on teams after data processed" do
    @tyler = YourTeam::User.first(:username=>"ubermajestix")
    @tyler.members.length.should == 1
  end
  
  it "should process image_url for member" do
      pending "needs to process the text for at least an url" do
        YourTeam::Member.first.image_url.should_not == nil
      end
  end

  
end