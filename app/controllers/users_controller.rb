class UsersController < ApplicationController

    get '/signup' do 
            erb :'users/signup'
    
    end 

    post '/signup' do 
        redirect '/users'
    end 




end
