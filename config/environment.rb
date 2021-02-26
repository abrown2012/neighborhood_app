ENV['SINATRA_ENV'] ||= "development"


require 'bundler/setup'
require 'dotenv/load'
require 'dotenv'
Dotenv.load

Bundler.require(:default, ENV['SINATRA_ENV'])

set :database_file, './database.yml'

require_all 'app'