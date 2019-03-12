class Child < ApplicationRecord
    validates_presence_of :first_name, :last_name
    has_many :chores
    has_many :tasks, through: :chores
    
    def name
    first_name + " " + last_name    
    end
    
    scope :alphabetical, -> { order("first_name, last_name asc") }
   scope :active, -> { where('active = ?', true) }
    
end
