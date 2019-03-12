class Chore < ApplicationRecord
    belongs_to :child
    has_many :tasks
    belongs_to :task
    validates_date :due_on
    
    scope :by_task, -> { joins(:task).order("name ASC") }
    scope :done, -> { where("completed = ?",true) }
    scope :past, -> { where("due_on < date('now')")}
    scope :upcoming, -> { where("due_on >= date('now')")}
    scope :pending, -> { where("completed = ?",false)}
   
    scope :chronological, -> { order("due_on ASC").order("completed ASC") }
    
    def destroy
   
    end
    
    def status
        if completed == true then
            return 'Completed'
        else
            return 'Pending'
        end
            
    end
end
