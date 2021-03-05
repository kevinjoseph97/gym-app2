class ApplicationController < Sinatra::Base

    configure do
      set(:views, 'app/views') #when we call the erb files this is where it looks for it
      set :public_folder, 'public'
      enable :sessions
      set :session_secret, 'cat' #setting this we we dont create a new cookie on every request sent 
    end

    get '/' do 
      @name = "Kev"
        erb :homepage
    end

 
    helpers do 

      def current_user 
        @user = User.find_by(id: session[:user_id])
      end


      def redirect_if_not_logged_in
        redirect '/login' unless current_user
      end


      def check_owner(obj)
        obj.user == current_user
      end







    end
    

    
end
