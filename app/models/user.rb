class User < ActiveRecord::Base
    has_many :days
    has_secure_password

        #this runs when we create a new user so we don't have the same user twice 
    validates_uniqueness_of(:username)
    validates :password, length: { minimum: 4 }
end