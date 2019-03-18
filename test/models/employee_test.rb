require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
    should have_many(:assignments)
  
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
    should validate_presence_of(:date_of_birth)
    should validate_presence_of(:ssn)
    should validate_presence_of(:role)
    
    scope :alphabetical, -> { order("first_name, last_name asc") }
    
    scope :younger_than_18', -> { where('date_of_birth < ?', DateTime.now )}
    scope :active, -> {where('active = ?',true)}
    scope :inactive, -> {where('active = ?',false)}
    scope :regulars, -> {where('role = ?', 'employee')}
    scope :managers, -> {where('role = ?', 'manager')}
    scope :admins, -> {where('role = ?', 'admin')}
    
    def name
        return first_name + ' ' + last_name 
    end

end
