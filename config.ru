  require './config/environment'

use Rack::MethodOverride
use UsersController
use Controller
run ApplicationController