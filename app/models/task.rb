class Task < ApplicationRecord
    validates_presence_of :name
    has_many :chores
    has_many :children, through: :chores
    validates :points, numericality: { only_integer: true }
    validates :points, numericality: { other_than: -2 }

    
    scope :alphabetical, -> { order("name asc") }
    scope :active, -> { where('active = ?', true) }
 
end
