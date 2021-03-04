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

end



