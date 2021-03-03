class DaysController < ApplicationController


    #to show all the days to the user 
    get '/days' do 
        #@days = ["Sunday", "Monday", "Tuesday"]
        @days = Day.all
        erb :'days/index'
    end 

    get '/days/new' do 
        erb :'days/new'
    end

    post '/days' do 
        @day = Day.create(params)
        erb :'days/show'

    end


    get '/days/:id' do 
        # days = [{day:"Sunday",workout:"chest", id: 1}, {day:"Monday", workout:"Legs", id: 2}, {day:"Tuesday",workout:"Arms", id: 3}]
        # @day = days.find {|d| d[:id]== params[:id].to_i}

        @day = Day.find(params[:id])
        erb :'days/show'
    end

    #to edit something by its id
    get '/days/:id/edit' do 


        erb :'days/edit'
    end




    



end