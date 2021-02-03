class ApplicationController < Sinatra::Base
    register Sinatra::ActiveRecordExtension
    enable :sessions 
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do 
        erb :index_not_logged_in
    end 

end