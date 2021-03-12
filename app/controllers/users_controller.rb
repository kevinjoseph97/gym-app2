class UsersController < ApplicationController

    get '/signup' do
        if session[:user_id]
            redirect "/users/#{session[:user_id]}"
        else
            erb :'users/signup'
        end
    end

    #create a user , check to see if they saved and set their id to the session id
    #redirect to their page 
    post '/signup' do
        ex = User.create(params)
        if ex.id
         session[:user_id] = ex.id
         redirect "/users/#{ex.id}"#set up a get route below for this 
        else
            erb :'/users/signup'
        end
    end

    get '/users/:id' do
        redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
        @days= @user.days
        erb :'users/show'
    end


    #set up post after this 
    get '/login' do 
        erb :'/users/login'
    end

    #find user and see if user exists and that the password stored is same as entered
    post '/login' do 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
        else
            erb :'/users/login'
        end

    end

    #clear out the session for logout function 
    get '/logout' do 
        session.clear
        redirect "/login"
    end


    get '/users' do 
        redirect_if_not_logged_in
        @users = User.all


        erb :'/users/index'
    end


end



