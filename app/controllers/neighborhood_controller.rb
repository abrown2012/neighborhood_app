class NeighborhoodsController < ApplicationController
    include Helpers  
    get '/neighborhoods/new' do
        erb :'/neighborhoods/new'
    end 

    post '/neighborhoods/new' do
        @neighborhood = Neighborhood.create(params["neighborhood"])
        redirect '/neighborhoods'
    end 
    
    get '/neighborhoods' do 
        @neighborhoods = Neighborhood.all 
        erb :'/neighborhoods/index'
    end  

    post '/neighborhoods/:id' do 

        if !current_user.neighborhoods.include?(Neighborhood.find(params["id"]))
            current_user.neighborhoods << Neighborhood.find(params["id"])
        end 

        redirect '/neighborhoods'
    end

    delete '/neighborhoods/:id' do 

        if current_user.neighborhoods.include?(Neighborhood.find(params["id"]))
            current_user.neighborhoods.delete(Neighborhood.find(params["id"]))
        end 
        
        redirect '/neighborhoods'

    end 
end