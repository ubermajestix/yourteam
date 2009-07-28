
require File.join(File.dirname(__FILE__), %w[spec_helper])

describe "putting people on teams" do
  #sample data
  before(:all) do
    sample_data
  end

  it "should be able to add members to a team" do
    Users[:tyler].add_member(:member=>Members[:ape_woman], :tagged_by=>Users[:jeff])
    Users[:tyler].members.should_not == nil
    Members[:ape_woman].tagged_by.should == Users[:jeff]
    Members[:ape_woman].user.should == Users[:tyler]
  end

  it "has a wrong way to add members to team" do
    # this is bad don't know how to make this raise error
    Users[:tyler].members << Members[:daper_dan]
    lambda{Members[:daper_dan].tagged_by}.should raise_error
  end

  it "member cannot belong to more than one team/user" do
     pending "don't know if we need a validation for all this or not" do
       # need validation that member is not on a team already
       # the only mechanism to add someone to a team is through...
       # 1. Twitter and our automated job or...
       # 2. With the web ui
       # So all team assignments are new members, there is no mechanism to add a member to more than one team...
       Users[:jeff].members << Members[:daper_dan]
       # does this just pick the first user for a member?
       Members[:daper_dan].user.should_not == Users[:jeff]
       Users[:jeff].members.should_not include(Members[:daper_dan])
     end
  end
  
  
end