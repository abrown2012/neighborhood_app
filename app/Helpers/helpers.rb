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

    def current_neighborhood 
        Neighborhood.find(params[:id])
    end 
    
    def all_states
        all_states = ["AL", "AK", "AS", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "GU", "HI", "ID", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP", "OH", "OK", "OR", "PA", "PR", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WV", "WI", "VI", "WA", "WY"]
    end 
end 