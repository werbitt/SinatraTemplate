require 'rubygems'
require 'bundler'
Bundler.require(:default)
require 'sinatra'

require 'lib/board'

class Application < Sinatra::Base
  
  configure do
    set :views, "#{File.dirname(__FILE__)}/views"
  end

  error do
    e = request.env['sinatra.error']
    Kernal.puts e.backtrace.join("\n")
    'Application error'
  end

  get '/' do
    'hello world'
  end
end