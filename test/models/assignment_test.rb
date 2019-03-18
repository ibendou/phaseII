require 'test_helper'

class AssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
   scope :current, -> { where('end_date == nil') }
   scope :past, -> { where('end_date < ?', Date.today) }
   scope :for_store, (store_id) -> {}
   scope :for_employee, (employee_id) -> {}
   scope :for_pay_level, (pay_level) -> {}
   scope :for_role, (role) -> {}
   scope :by_store, (store_id) -> {}
   scope :by_employee, (last, first) -> {}
   scope :chronological, -> {order('end_date')}

end
