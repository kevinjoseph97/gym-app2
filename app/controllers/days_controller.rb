class DaysController < ApplicationController


    #to show all the days to the user 
    get '/days' do 
        @days = ["Sunday", "Monday", "Tuesday"]
        @workouts = ["legs"]
        erb :'days/index'
    end 

    get '/days/new' do 
        erb :'days/new'
    end

    post '/days' do 
        @day = params
        erb :'days/show'


    end


    get '/days/:id' do 
        days = [{day:"Sunday",workout:"chest", id: 1}, {day:"Monday", workout:"Legs", id: 2}, {day:"Tuesday",workout:"Arms", id: 3}]
        @day = days.find {|d| d[:id]== params[:id].to_i}
        erb :'days/show'
    end




    



end