class Day < ActiveRecord::Base 
    belongs_to :user
    validates_presence_of :day, :workout
    # validates_acceptance_of :day, :accept => 'Sunday' and 'Monday' and 'Tuesday'
end





