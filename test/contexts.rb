module Contexts
  def create_employees
    @alex = FactoryBot.create(:employee)
    @imane = FactoryBot.create(:employee, first_name: "Imane", last_name: "Bendou", ssn: "02345320", phone:"4334978211", role: "manager", active: false)
    @mark = FactoryBot.create(:employee, first_name: "Mark",ssn: "021234520",date_of_birth: Date.new(2003, 11, 10) , phone: "433448711", role:"employee")
  end
  
  def destroy_employees
    @alex.destroy
    @imane.destroy
    @mark.destroy
  end
  
  def create_stores
    @cmu = FactoryBot.create(:store)
    @texas = FactoryBot.create(:store, name: "Texas", street: "Some Street", state: "OH", city: "Alexandria", zip: "43001", longitude: "45.98755", latitude:"43.987643", active: false)
    @damam = FactoryBot.create(:store, name: "Damam", street: "street2", state: "WV", city: "Accoville",zip: "25606",longitude: "80.98755", latitude:"70.987643" )

  end
  
  def destroy_stores
    @cmu.destroy
    @texas.destroy
    @damam.destroy
  end
  
  def create_assignments
    @assignment1 = FactoryBot.create(:assignment, employee: @alex, store: @cmu, end_date:nil, pay_level:2)
    @assignment2 = FactoryBot.create(:assignment, employee: @mark, store: @texas , end_date: Date.new(2019,3,2), pay_level:3)
    @assignment3  = FactoryBot.create(:assignment, employee: @imane, store: @damam, end_date: Date.new(2019,4,2), pay_level: 6)

  end
  
  def destroy_assignments
   # @assignment1.destroy
    #@assignment2.destroy
    #@assignment3.destroy
  end
end