class UsersController < ApplicationController

    get '/signup' do
        if session[:user_id]
            redirect "/users/#{session[:user_id]}"
        end
        erb :'users/signup'
    end

    post '/signup' do
        ex = User.create(params)
        if ex.id
         session[:user_id] = ex.id
         redirect "/users/#{ex.id}"
        else
            erb :'/users/signup'
        end
    end

    get '/users/:id' do
        redirect_if_not_logged_in
        @user = User.find_by(id: params[:id])
        @days= @user.days
        # binding.pry
        
        erb :'users/show'
    end

    get '/login' do 
        erb :'/users/login'
    end

    post '/login' do 
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
        else
            erb :'/users/login'
        end

    end


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



