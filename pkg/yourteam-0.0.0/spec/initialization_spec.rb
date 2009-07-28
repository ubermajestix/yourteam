require File.expand_path(
    File.join(File.dirname(__FILE__), %w[.. lib yourteam]))
    
describe YourTeam do
  
  it "it should be able to intialize" do
    lambda{YourTeam.initialize(:environment=>"test")}.should_not raise_error  
  end

  
end

# EOF
