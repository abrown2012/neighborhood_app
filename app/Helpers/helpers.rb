module Helpers
    def is_logged?
        !!session[:user_id]
    end  

    def current_user
        User.find(session[:user_id])
    end

    def current_post 
        Post.find(params["id"])
    end 
    
end 