class UsersController < ApplicationController

    get '/signup' do 
        erb :'/users/signup'
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

    patch '/feed/:id/edit' do 
        
        post =  Post.find(params["id"])
        if post.update(title: params[:title], text: params[:text], neighborhood_id: params[:post][:neighborhood_id])
            #add flash message 
            #add redirect 
        else 
            #add flash message 
            #add redirect  (all put, patch, delete add "if")
        end 
        redirect '/posts'
    end 

    delete '/neighborhoods/:id/delete' do 
        neighborhood = Neighborhood.find(params["id"])
        if neighborhood.delete
            redirect '/neighborhoods'
            #add flash message 
        else 
            # add flash message
        end 
        redirect '/neighborhoods'
    end 
 
    get '/users/:id/edit' do 
        erb :'/users/edit'
    end
    
    patch '/users/:id/edit' do 
        
        user = User.find(params["id"])
        if user.update(params[:user])
            redirect '/'
        else
            binding.pry
            redirect '/'  
        end 
       
    end 

end
