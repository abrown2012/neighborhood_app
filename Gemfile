# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'activerecord', '~> 5.2', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'require_all'
gem 'thin'
gem 'bcrypt'
gem 'shotgun'
gem 'faker'
gem "tux"
gem 'pry'
gem 'dotenv'
gem 'sinatra-flash'

group :development do
    gem 'sqlite3'
end

group :production do
    gem 'rake'
    gem 'pg'
    gem 'activerecord-postgresql-adapter'
end