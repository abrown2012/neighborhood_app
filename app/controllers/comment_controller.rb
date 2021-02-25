class CommentsController < ApplicationController
    include Helpers  
    post '/comment/:id' do 
            if comment = Comment.new(content: params[:content], user_id: current_user.id, post_id: params[:id])
                selected_post = Post.find(params[:id]) 
                selected_post.comments << comment
                current_user.comments << comment
                flash[:success] = "Comment successfully added!" 
                redirect '/user_feed'
            else
                flash[:error] = "Please try again!" 
                redirect '/user_feed'
            end 
    end 
end
