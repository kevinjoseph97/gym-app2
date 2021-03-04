class User < ActiveRecord::Base
    has_many :days
    has_secure_password

        #this runs when we create a new user
    validates_uniqueness_of(:username)
    
end