class NeighborhoodsController < ApplicationController
    include Helpers  
    get '/neighborhoods/new' do
        if is_logged?
            erb :'/neighborhoods/new'
        else 
            erb :index_log_in
        end
    end 

    post '/neighborhoods' do
        @neighborhood = Neighborhood.create(neighborhood_name: params[:neighborhood][:neighborhood_name], city: params[:neighborhood][:city], state: params[:neighborhood][:state], owner_id: current_user.id)
        redirect '/neighborhoods'
    end 
    
    get '/neighborhoods' do 
        if is_logged?
            @neighborhoods = Neighborhood.all 
            erb :'/neighborhoods/index'
        else 
            erb :index_log_in
        end
    end  

    post '/neighborhoods/:id' do 
        
        if !current_user.neighborhoods.include?(Neighborhood.find(params["id"]))
            current_user.neighborhoods << Neighborhood.find(params["id"])
        end 

        redirect '/neighborhoods'
    end

    delete '/neighborhoods/:id' do 
     

        if Neighborhood.find(params["id"]).delete
            redirect '/neighborhoods'
        end 
        
        redirect '/neighborhoods'

    end 
end