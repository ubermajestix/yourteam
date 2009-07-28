# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

begin
  require 'bones'
  Bones.setup
rescue LoadError
  begin
    load 'tasks/setup.rb'
  rescue LoadError
    raise RuntimeError, '### please install the "bones" gem ###'
  end
end

ensure_in_path 'lib'
require 'yourteam'

task :default => 'spec:run'

PROJ.name = 'yourteam'
PROJ.authors = 'Tyler Montgomery'
PROJ.email = 'tyler@is.stupidawesome.com'
PROJ.url = 'http://...'
PROJ.version = YourTeam::VERSION
PROJ.rubyforge.name = 'yourteam'

PROJ.spec.opts << '--color'

# EOF
