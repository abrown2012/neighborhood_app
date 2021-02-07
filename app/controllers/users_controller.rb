class UsersController < ApplicationController

    get '/signup' do 
            erb :'/users/signup'
    
    end 

    post '/signup' do 
        user = User.create(name: params[:name], password: params[:password], email: params[:email])
        if user.valid?
            flash[:success] = "Congratulations! You successfully created your Neighborhood account."
            session["user_id"] = user.id 
            redirect '/userneighborhoods'
        else 
            flash[:error] = user.errors.full_messages.first
            redirect '/signup'
        end     
    end 
    
    get '/' do 
        @users = User.all 
        if is_logged?
            erb :'/posts/feed'
        else 
            erb :index_log_in
        end 
    end 


    post '/login' do 
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session["user_id"] = user.id
            flash[:success] = "Successfully logged in!"
            redirect "/"
          else
            flash[:error] = "Invalid credentials"
            redirect "/"
          end
    end 



end
