class ApplicationController < Sinatra::Base

    configure do
      set(:views, 'app/views') #when we call the erb files this is where it looks for it
      set :public_folder, 'public'
    end

    get '/' do 
        erb :homepage
    end

end
