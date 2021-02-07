require './config/environment'


class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    enable :sessions 
    set :session_secret, ENV['SESSION_SECRET'] 
    set :public_folder, 'app/public'
    set :views, 'app/views'
    register Sinatra::Flash
    include Helpers 

    get '/' do 
        @users = User.all 
        if is_logged?
            erb:index 
        else 
            erb :index_log_in
        end 
    end 

    not_found do 
        erb :not_found 
    end 
end