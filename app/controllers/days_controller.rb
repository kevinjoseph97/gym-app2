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

    #this is where are creating the day
    #to see the day created call "@day in the console"
    #to find user logged in we can do user1 = User.find_by(session[:user_id].to_s)
    #to merge them together do user1.days<<@day
    post '/days' do 
        @day = Day.create(params)
        @day.user_id = session[:user_id]
        @day.save
        redirect "/days/#{@day.id}"
    end

    # create a dynamic route that has an :id placeholder to show specifc day
    get '/days/:id' do 
        redirect_if_not_logged_in
        @day = Day.find_by(id: params[:id])
        # binding.pry
        if !@day
            redirect('/days')
        end
        erb :'/days/show'
    end

    #to edit something by its id
    #remember to make a patch request
    get '/days/:id/edit' do 
        redirect_if_not_logged_in
        @day = Day.find_by(id: params[:id])
        if !@day
            redirect('/days')
        end
        erb :'days/edit'
    end

    patch '/days/:id' do
        @day= Day.find_by(id: params[:id])
        if @day.user_id == session[:user_id]
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