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
    get '/posts/new' do 
        erb :'/posts/new'
    end 

    post '/posts/new' do 
        
        post = Post.new(title: params[:title], text: params[:text])
        post.neighborhoods << Neighborhood.find(params["post"]["neighborhood_id"])
        current_user.posts << post
        
        redirect '/posts/new'
        
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

    get '/posts' do 
        if is_logged?
            @posts = Post.all 
            erb :'/posts/feed'
        else
            erb :index_log_in
        end
    end  

    get '/user_feed' do 
        if is_logged?
            @posts = Post.all 
            erb :'/posts/posts'
        else
            erb :index_log_in
        end
    end  

    get '/feed/:id/edit' do 
        erb :'/posts/edit'
    end

    patch '/feed/:id/edit' do 
        Post.find(params["id"]).update(title: params[:title])
        Post.find(params["id"]).update(text: params[:text])
        redirect '/posts/feed'
    end 
 
    get '/:id/edit' do 
        erb :'/users/edit'
    end
    
    patch '/:id/edit' do 
        @user = User.find(params["id"])
        @user.update(name: params[:name])
        @user.update(email: params[:email])
        redirect '/'
    end 

end
