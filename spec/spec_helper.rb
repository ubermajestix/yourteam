
require File.expand_path(
    File.join(File.dirname(__FILE__), %w[.. lib yourteam]))

Spec::Runner.configure do |config|
  YourTeam.initialize(:environment=>"test")
  Members = {}
  Users = {}
  def sample_data
    YourTeam.logger.info "loading sample data"
    Users[:tyler] = YourTeam::User.create(:username=>"ubermajestix")
    Users[:jeff] = YourTeam::User.create(:username=>"jlarrimore")
    Members[:daper_dan] = YourTeam::Member.create(:image_url=>"http://twitpic.com/bambam.jpg", :name => "Daper Dan")
    Members[:ape_woman] = YourTeam::Member.create(:image_url=>"http://twitpic.com/boom.jpg", :name=>"Planet of the Apes Woman")
  end
end

# EOF
