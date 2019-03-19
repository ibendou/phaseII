class Assignment < ApplicationRecord
   belongs_to :employee
   belongs_to :store
   validates_presence_of(:store_id, :employee_id )
  
   scope :current, -> { where(end_date:nil) }
   scope :past, -> { where('end_date < ?', Date.today) }
   scope :for_store,  -> (store_id) {joins(:store).where('store_id = ?', store_id)}
   scope :for_employee,  ->  (employee_id) { joins(:employee).where('employee_id = ?', employee_id) }
   scope :for_pay_level,  -> (pay_level) {where('pay_level = ?',pay_level)}
   scope :for_role,  -> (role) {joins(:employee).where('role = ?', role)}
   scope :by_store,  ->  {joins(:store).select(:name, :id).order('name')}
   scope :by_employee,  ->  {joins(:employee).select(:last_name, :first_name, :id).order('last_name, first_name')}
   scope :chronological, -> {order('end_date')}
 
   def end_previous_assignment
        
   end
end
