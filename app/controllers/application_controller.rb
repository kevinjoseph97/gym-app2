class ApplicationController < Sinatra::Base

  configure do
    set(:views, 'app/views') #when we call the erb files this is where it looks for it in the absolute path 
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, 'cat' #setting this we we dont create a new cookie on every request sent 
  end

  #set up homepage display 
  #erb is going to be a instance of our application
  get '/' do 
      erb :homepage
  end


  #set up helper methods
  helpers do 

    def current_user 
      @user = User.find_by(id: session[:user_id])
    end


    def redirect_if_not_logged_in
      redirect '/' unless current_user
    end


    def check_owner(obj)
      obj.user == current_user
    end

    #valid day helper? 
   
  end
    
end
