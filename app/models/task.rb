class Task < ApplicationRecord
    belongs_to :chores
    has_one :child, through: :chore
end
