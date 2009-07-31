require 'rubygems'
require 'lib/yourteam'


class YourTeamSite < YourTeam::App
  #set :public,      File.expand_path(File.dirname(__FILE__), "public")
  set :environment, :development
end

run YourTeamSite.new