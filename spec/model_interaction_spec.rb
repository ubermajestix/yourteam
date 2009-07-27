
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe "How the models interact with each other" do
  #sample data
  before(:each) do
    puts "--- loading sample data"    
    @member = YourTeam::Member.create(:image_url=>"http://twitpic.com/boom.jpg")
    @user = YourTeam::User.create(:username=>"ubermajestix", :members=>[@member])
  end

  it "user should have team members" do
    @user.members.first.should == @member
  end
  
end