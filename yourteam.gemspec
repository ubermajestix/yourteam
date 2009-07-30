# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yourteam}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tyler Montgomery"]
  s.date = %q{2009-07-30}
  s.default_executable = %q{yourteam_console}
  s.description = %q{for use with yourte.am app}
  s.email = %q{tyler@is.stupidawesome.com}
  s.executables = ["yourteam_console"]
  s.extra_rdoc_files = ["History.txt", "README.txt", "bin/yourteam_console"]
  s.files = ["History.txt", "README.txt", "Rakefile", "bin/yourteam_console", "db/development.sqlite3", "db/production.sqlite3", "lib/yourteam.rb", "lib/yourteam/member.rb", "lib/yourteam/scraper.rb", "lib/yourteam/team.rb", "lib/yourteam/user.rb", "spec/data/twitter.json", "spec/initialization_spec.rb", "spec/model_interaction_spec.rb", "spec/scraping_tweets_spec.rb", "spec/spec_helper.rb", "tasks/db.rake"]
  s.homepage = %q{http://...}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{yourteam}
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{for use with yourte}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bones>, [">= 2.5.1"])
    else
      s.add_dependency(%q<bones>, [">= 2.5.1"])
    end
  else
    s.add_dependency(%q<bones>, [">= 2.5.1"])
  end
end
