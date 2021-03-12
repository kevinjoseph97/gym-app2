class DaysController < ApplicationController


    get '/days' do
        redirect_if_not_logged_in
        @workouts = Day.all
        erb :'days/index'
    end

    # create a route to show the new workout form
    get '/days/new' do 
        redirect_if_not_logged_in
        erb :'days/new'
    end

   
    post '/days' do 
        binding.pry
        @day = Day.create(params)#saves our day into the database but does not give it a user_id
        binding.pry
        if @day.valid? == true
            @day.user_id = session[:user_id] #sets user_id to the user logged in 
            @day.save
            redirect "/days/#{@day.id}"
        else 
            @day.valid? == false
            erb :'days/new'
        end
    end

    # create a dynamic route that has an :id placeholder to show specifc day 
    get '/days/:id' do 
        redirect_if_not_logged_in
        @day = Day.find_by(id: params[:id])
        if !@day#if there was no day redirect back
            redirect('/days')
        end
        erb :'/days/show'
    end

    #to edit something by its id
    #remember to make a patch request
    get '/days/:id/edit' do 
        redirect_if_not_logged_in
        @day = Day.find_by(id: params[:id])#
        if !@day
            redirect('/days')
        end
        erb :'days/edit'
    end

    patch '/days/:id' do
        @day= Day.find_by(id: params[:id])
        if @day.user_id == session[:user_id]
            # binding.pry
            @day.update(params[:day])       
        end
        erb :'/days/show' 

    end

    #delete button/form make it dynamic so put an id 
    delete '/days/:id' do 
      
        @day= Day.find_by(id: params[:id])
        if @day.user_id == session[:user_id]
          @day.delete
          redirect('/days')
        else
            erb :'days/show'
        end
    end
end