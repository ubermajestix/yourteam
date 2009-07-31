require 'rubygems'
require 'lib/yourteam'


class YourTeamSite < YourTeam::App
  #set :public,      File.expand_path(File.dirname(__FILE__), "public")
  set :environment, :production
  YourTeam.logger.info "Environment: #{ENV['RACK_ENV'].inspect}"
  YourTeam.initialize(:environment=>ENV['RACK_ENV'] || "development")
end

run YourTeamSite.new