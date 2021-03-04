class UsersController < ApplicationController

    get '/signup' do
        if session[:user_id]
            redirect "/users/#{session[:user_id]}"
        end
        erb :'users/signup'
    end

    post '/users' do
        ex = User.create(params)
        session[:user_id] = ex.id
        binding.pry
        redirect "/users/#{ex.id}"
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'users/show'
    end

    get '/login' do 
        erb :'/users/login'
    end

    post '/login' do 
        # binding.pry
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



end



