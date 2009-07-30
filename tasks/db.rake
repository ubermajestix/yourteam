namespace :db do  
  task :init do
    YourTeam.initialize
  end  
  desc "runs the Datamapper.auto_migrate!"
  task :migrate => :init do
    DataMapper.auto_migrate!
  end
end