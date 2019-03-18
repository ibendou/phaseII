module Contexts
  def create_employees
    @alex = FactoryBot.create(:employee)
    @imane = FactoryBot.create(:employee, first_name: "Imane", last_name: "Bendou", ssn: "02345320", date_of_birth: 1976-01-09, phone:"4334978211", role: "manager",  active: false)
    @mark = FactoryBot.create(:employee, first_name: "Mark",ssn: "021234520", phone: "433448711")
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
    @assignment1 = FactoryBot.create(:assignment, employee: @alex, store: @cmu)
    @assignment1 = FactoryBot.create(:assignment, employee: @mark, store: @texas)
    @assignment1  = FactoryBot.create(:assignment, employee: @imane, store: @damam, end_date: 2012-01-31, pay_level: 6)

  end
  
  def destroy_assignments

  end
end