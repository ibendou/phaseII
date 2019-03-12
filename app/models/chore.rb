class Chore < ApplicationRecord
    belongs_to :child
    has_many :tasks
    #belongs_to :task
end
