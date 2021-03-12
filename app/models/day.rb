class Day < ActiveRecord::Base 
    belongs_to :user
    validates_presence_of :day, :workout
    validates :day, inclusion: { within: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]}
end





