require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
    should have_many(:assignments)
  
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
    should validate_presence_of(:date_of_birth)
    should validate_presence_of(:ssn)
    should validate_presence_of(:role)
    
    context "Creating employees" do
        setup do
          create_employees
        end 
    
        teardown do
          destroy_employees
        end 
    
        should "return all employees under 18 years old" do
            assert_equal ["Heimann, Mark"], Employee.younger_than_18.alphabetical.map{|s| s.name}
        end
        
        should "return all employees 18 years old or older" do
            assert_equal ["Heimann, Alex", "Bendou, Imane"], Employee.is_18_or_older.alphabetical.map{|s| s.name}
        end
        
        should "return all active employees" do
            assert_equal ["Heimann, Alex", "Heimann, Mark"], Employee.active.alphabetical.map{|s| s.name}
        end
        
        should "return all regular employees" do
            assert_equal ["Heimann, Mark"], Employee.regulars.alphabetical.map{|s| s.name}
        end
        
        should "return all managers" do
            assert_equal ["Bendou, Imane"], Employee.managers.alphabetical.map{|s| s.name}
        end
        
        should "return all admin employees" do
            assert_equal ["Heimann, Alex"], Employee.admins.alphabetical.map{|s| s.name}
        end
        
        should "return all employees in alphabetical order" do
            assert_equal ["Heimann, Alex", "Bendou, Imane", "Heimann, Mark"], Employee.alphabetical.map{|s| s.name}
        end
        
        should "return all employee employee with name as a string first_name, last_name in that order" do
            assert_equal ["Heimann, Alex", "Bendou, Imane", "Heimann, Mark"], Employee.alphabetical.map{|s| s.name}
        end
        
        should "return all employee employee with name as a string first_name last_name in that order" do
            assert_equal ["Alex Heimann", "Imane Bendou", "Mark Heimann"], Employee.alphabetical.map{|s| s.proper_name}
        end
        
        should " returns a boolean indicating whether this employee is over 18 or not" do
                assert_equal @imane.over_18?, true
        end
    end
    
    
    context "Creating employees, stores and assignments" do
        setup do
          create_stores
          create_employees
          create_assignments
        end 
    
        teardown do
          destroy_stores
          destroy_employees
          destroy_assignments
        end 
    
        should "return the employee's current assignment or nil if the employee does not have a current assignment." do
            puts 'here 1'
            puts  @mark.current_assignment
            puts 'here 2'
          #  assert_equal [], @mark.current_assignment
        end
    end
    
end
