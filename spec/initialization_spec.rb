require File.expand_path(
    File.join(File.dirname(__FILE__), %w[.. lib yourteam]))
    
describe YourTeam do
  
  it "should raise error if env != prod|dev|test" do
      lambda{YourTeam.initialize(:environment=>"not an environment")}.should raise_error 
  end
  
  it "it should be able to intialize" do
    lambda{YourTeam.initialize(:environment=>ENV['YT_ENV'] || "test")}.should_not raise_error  
  end

  
end

# EOF
