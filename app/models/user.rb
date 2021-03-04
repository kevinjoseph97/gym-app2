class User < ActiveRecord::Base
    has_many :days
    has_secure_password
end