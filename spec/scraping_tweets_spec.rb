
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe "processing twitter data" do
  before(:each) do
    @scraper = YourTeam::Scraper.new
    # need to use sample json file instead of hitting twitter
    # @scraper.tweets = parsed json from file
  end

  it "should parse json and return hash" do
    results = @scraper.get_tweets
    results.should be_kind_of(Hash)
    @scraper.tweets.should be_kind_of(Hash)
    @scraper.tweets.should == results
  end
  
  it "should raise error processing no tweets" do
    @new_scraper = YourTeam::Scraper.new
    lambda{@new_scraper.process_tweets}.should raise_error("don't got no tweets to process dog.")
  end  
  
  it "should return the tagged_by user" do
    @scraper.get_tweets
    result = @scraper.process_tweets
  end
  
  it "should create a user from a username" do
    @scraper.create_user("ubermajestix")
    @user = YourTeam::User.first(:username=>"ubermajestix")
    @user.should_not == nil
    @scraper.create_user("ubermajestix")
    YourTeam::User.all(:username=>"ubermajestix").length.should_not > 1
  end
  
end