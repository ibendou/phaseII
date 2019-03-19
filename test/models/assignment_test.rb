require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  
  should belong_to(:employee)
  should belong_to(:store)
  
  should validate_presence_of(:employee_id)
  should validate_presence_of(:store_id)
should validate_presence_of(:pay_level)
should validate_presence_of(:start_date)



   context "Creating employees, stores and assignments....." do
        setup do
          create_stores
          create_employees
          create_assignments
        end 
    
        teardown do
          destroy_assignments
          destroy_employees
          destroy_stores          
        end 
    
        should "return all the assignments that are considered current." do
            assert_equal [1], Assignment.current.map{|s| s.id}
        end
        
        should "return all the assignments that have terminated." do
            assert_equal [2], Assignment.past.map{|s| s.id}
        end

        should "return all assignments that are associated with a given store (parameter: store_id)" do
            assert_equal [1], Assignment.for_store(1).map{|s| s.id}
        end

        should "return all assignments that are associated with a given employee  (parameter: employee_id)" do
            assert_equal [1], Assignment.for_employee(1).map{|s| s.id}
        end

        should "returns all assignments that are associated with a given pay_level (parameter: pay_level)" do
            assert_equal [3], Assignment.for_pay_level(6).map{|s| s.id}
        end
        
        should "returns all assignments that are associated with a given  role (parameter: role)" do
            assert_equal [3], Assignment.for_role('manager').map{|s| s.id}
        end
        
        should "returns assignments ordered by store" do
            assert_equal [["CMU", 1], ["Damam", 3], ["Texas", 2]], Assignment.by_store.map{|s| [s.name, s.id]}
        end

        should "returns assignments ordered by employee" do
            assert_equal [["Bendou", "Imane", 3], ["Heimann", "Alex", 1], ["Heimann", "Mark", 2]], Assignment.by_employee.map{|s| [s.last_name,s.first_name, s.id]}
        end
        
        should "returns assignments ordered chronologically with the most recent assignments listed first " do
            assert_equal [[1, ""], [2, "2019-03-02"], [3, "2019-04-02"]], Assignment.chronological.map{|s| [s.id, s.end_date.to_s]}
        end



        
  end
end
