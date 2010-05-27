
require 'rubygems'
require 'bundler'
Bundler.require(:default, :test)
require 'sinatra'
require 'spec'
require 'spec/interop/test'
require 'rack/test'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, :false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require 'application'

# TODO: set up database

Spec::Runner.configure do |config|
  config.include(Rack::Test::Methods)  
  
  def app
    @app ||= Rack::Builder.app do
      use Rack::Session::Cookie
      
      run Application
    end
  end
    
  # TODO: reset database before each example is run
end