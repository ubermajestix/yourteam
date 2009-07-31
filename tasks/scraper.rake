namespace :scrape do
  task :init do
    ENV['RACK_ENV'] ||= "development"
    YourTeam.initialize(:environment=>ENV['RACK_ENV'])
  end
  
  desc "scrape the twitters"
  task :tweets => :init do
    begin
      scraper = YourTeam::Scraper.new
      scraper.get_tweets
      scraper.process_tweets
    rescue StandardError => e
      YourTeam.logger.fatal e.inspect
    end
  end
  
  task :curl_test => :init do
    scraper = YourTeam::Scraper.new
    scraper.curl_test
  end
end