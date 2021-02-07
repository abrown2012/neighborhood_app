class UsersController < ApplicationController

    get '/signup' do 
            erb :'users/signup'
    
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




end
