require './config/environment'

use Rack::MethodOverride #middleware ... helps with patch or delete 
use UsersController
use DaysController
run ApplicationController