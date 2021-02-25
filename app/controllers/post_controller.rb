class PostsController < ApplicationController
    include Helpers  
    get '/posts/new' do 
        erb :'/posts/new'
    end 

    post '/posts' do #new was deleted here 
        if is_logged?
            post = Post.new(title: params[:title], text: params[:text]) #add if statemetn
            selected_neighborhood = Neighborhood.find(params["post"]["neighborhood_id"])
            selected_neighborhood.posts << post 
            current_user.posts << post
            flash[:success] = "Your post was successfully!"
            redirect '/posts' 
        else 
            flass[:error] = 'Please try again'
            redirect '/posts/new'
        end 
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
            erb :'/posts/posts'
        else
            erb :index_log_in
        end
    end 

    delete '/feed/:id/delete' do 
        post = Post.find(params["id"])
        if post.delete
            redirect '/posts'
            flash[:success] = "Your post was deleted!" 
        else 
            flass[:error] = 'Please try again'
            redirect '/posts'
        end 
    end 

    get '/feed/:id/edit' do 
        erb :'/posts/edit'
    end

    patch '/feed/:id/edit' do 
        
        post =  Post.find(params["id"])
        if post.update(title: params[:title], text: params[:text], neighborhood_id: params[:post][:neighborhood_id])
            flash[:success] = "Your post was edited successfully!" 
            redirect '/posts'
        else 
            flash[:error] = "Please try again" 
            redirect '/feed/:id/edit'
        end 
    end 

end 