class UsersController < ApplicationController
    include Helpers  
    get '/signup' do 
        erb :'/users/signup'
    end 

    get '/about' do 
   
            erb :'/about'
     

    end 

    post '/signup' do 
        user = User.create(name: params["name"], email: params["email"], password: params["password"])
        
        if user.valid?
            flash[:success] = "Congratulations! You successfully created your Neighborhood account."
            session["user_id"] = user.id 
            redirect "/neighborhoods"
        else 
            flash[:error] = user.errors.full_messages.first
            redirect '/signup'
        end     
    end 

    get '/' do 
        @users = User.all 
        if is_logged?
            @posts = Post.all 
            erb :'/posts/posts'
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

    get '/logout' do 
        session.clear
        redirect '/'
    end 

    get '/feed/:id/edit' do 
        erb :'/posts/edit'
    end
 
    get '/users/:id/edit' do 
        erb :'/users/edit'
    end
    
    patch '/users/:id/edit' do 
        user = User.find(params["id"])
        if user.update(params[:user])
            redirect '/'
        else
            redirect '/'  
        end 
    end 
end
