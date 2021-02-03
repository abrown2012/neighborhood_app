module Helpers
    def is_logged?
        !!session[:user_id]
    end  
end 