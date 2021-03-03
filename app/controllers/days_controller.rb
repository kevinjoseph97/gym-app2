class DaysController < ApplicationController


    #to show all the days to the user 
    get '/days' do 
        @days = Day.all
        erb :'days/index'
    end 

    get '/days/new' do 
        erb :'days/new'
    end

    post '/days' do 
        @day = Day.create(params)
        binding.pry
        redirect "/days/#{@day.id}"

    end


    get '/days/:id' do 
        @day = Day.find(params[:id])
        erb :'days/show'
    end

    #to edit something by its id
    #remember to make a patch request
    get '/days/:id/edit' do 
        @day = Day.find(params[:id])
        erb :'days/edit'
    end

    patch '/days/:id' do
        
        @day= Day.find(params[:id])
        @day.update(params[:day])
        erb :'/days/show'        

    end

    #delete button/form make it dynamic so put an id 
    delete '/days/:id' do 
        day= Day.find(params[:id])
        day.delete
        redirect('/days')
    end







    



end