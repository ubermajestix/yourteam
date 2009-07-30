require 'rubygems'
# sudo gem install dm-core do_sqlite3 --source http://gems.datamapper.org -v 0.10.0
require 'dm-core'
require 'logging'
require 'json/ext'
require 'curb'


module YourTeam
  # :stopdoc:
  VERSION = '0.0.0'
  LIBPATH = ::File.expand_path(::File.dirname(__FILE__)) + ::File::SEPARATOR
  PATH = ::File.dirname(LIBPATH) + ::File::SEPARATOR
  # :startdoc:

  class << self
    def initialize(opts={})      
      logger.info "Initializing YourTeam"
      @environment = opts.delete(:environment)            
      logger.info "environment: #{@environment}"
      establish_database_connection
    end
    public :initialize
  
    def logger
      return @logger if @logger
      Logging.appenders.stdout(:level => :debug,:layout => Logging.layouts.pattern(:pattern => '[%c:%5l] %p %d --- %m\n'))
      log = Logging.logger['YourTeam']
      log.add_appenders 'stdout'
      @logger = log
    end
    
    def environment
      @environment
    end
  
    def establish_database_connection
      db = @environment == "test" ? "sqlite3::memory:" : "sqlite3:///#{Dir.pwd}/db/#{@environment}.sqlite3"
      logger.info "connecting to database #{db}"
      DataMapper.setup(:default, db)
      DataMapper::Logger.new(STDOUT, @environment == "test" ? :debug : :info) # :off, :fatal, :error, :warn, :info, :debug
      DataMapper.auto_migrate! if @environment == "test"
    end

    def version
      VERSION
    end

    def libpath( *args )
      args.empty? ? LIBPATH : ::File.join(LIBPATH, args.flatten)
    end

    def path( *args )
      args.empty? ? PATH : ::File.join(PATH, args.flatten)
    end

    def require_all_libs_relative_to( fname, dir = nil )
      dir ||= ::File.basename(fname, '.*')
      search_me = ::File.expand_path(
          ::File.join(::File.dirname(fname), dir, '**', '*.rb'))
      Dir.glob(search_me).sort.each {|rb| require rb}
    end
  end # class << self
end  # module YourTeam
YourTeam.require_all_libs_relative_to(__FILE__)
# EOF