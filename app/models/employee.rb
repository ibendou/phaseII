class Employee < ApplicationRecord
    has_many(:assignments)
    validates_presence_of(:first_name, :last_name, :date_of_birth, :ssn, :role)
    validates_date :date_of_birth
    validates_format_of :first_name, with: /\D/
    validates_format_of :last_name, with: /\D/
    validates_format_of :role, with: /\D/
    
    
   # validates_format_of :ssn, with: (\d{3}-\d{2}-\d{4})|(\d{3}\d{2}\d{4})$
   # validates_format_of :phone, with: /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/  
    
    scope :alphabetical, -> { order("first_name, last_name asc") }
    
    scope :younger_than_18, -> { where('date_of_birth > ?', 18.years.ago )}
    scope :is_18_or_older, -> { where('date_of_birth < ?', 18.years.ago )}
    scope :active, -> {where('active = ?',true)}
    scope :inactive, -> {where('active = ?',false)}
    scope :regulars, -> {where('role = ?', 'employee')}
    scope :managers, -> {where('role = ?', 'manager')}
    scope :admins, -> {where('role = ?', 'admin')}
    scope :asignments, -> {joins(:assignments)}
    
    
    #join (current assignment)
    
    def name
         last_name + ', ' + first_name
    end

    def proper_name
         first_name + ' ' + last_name 
    end  
    
    def age
       ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor 
    end
    
    def over_18?
        if age >= 18 then
            return true
        else
            return false
        end
    end
    
    def current_assignment
        assignments.where("end_date = ?", nil)
    end
    
    
    def destroy
    
    
    end
end
