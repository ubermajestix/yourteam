module YourTeam
  class App < Sinatra::Base
    set :views, File.join(File.dirname(__FILE__), '/views')
  
    configure do
      YourTeam.initialize(:environment=>ENV['RACK_ENV'] || "development")
    end

    get '/' do
       @users = YourTeam::User.all
       puts "=="*45
       puts @users.inspect
       puts "=="*45
       erb :index
    end       
  end
end  
