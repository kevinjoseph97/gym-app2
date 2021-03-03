class User < ActiveRecord::Base
    has_many :days
end