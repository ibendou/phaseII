class Child < ApplicationRecord
    validates_presence_of :first_name, :last_name
    has_many :chores
    has_many :tasks, {:through=>:chores, :source=>"task"}
    
    def name
    first_name + " " + last_name    
    end
    
    scope :alphabetical, -> { order("first_name, last_name asc") }
    scope :active, -> { where('active = ?', true) }
    
    def points_earned
         self.chores.done.inject(0){|sum,chore| sum += chore.task.points}
    end 

end
