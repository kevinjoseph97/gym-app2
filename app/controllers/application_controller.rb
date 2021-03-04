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

end
