class Day < ActiveRecord::Base 
    belongs_to :user

    validates_presence_of :day
end