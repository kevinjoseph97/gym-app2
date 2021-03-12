require 'bundler/setup'
Bundler.require(:default)

require_all 'app'

#set up the database
set(:database, {adapter: "sqlite3", database: "db/gym_app2.sqlite3"})