module Contexts
  def create_employees
    @alex = FactoryBot.create(:employee)
    @imane = FactoryBot.create(:employee, first_name: "Imane", last_name: "Bendou", ssn: "023455320", date_of_birth: 1976-01-09, phone:"433488211", role: "manager"  active: false)
    @mark = FactoryBot.create(:employee, first_name: "Mark",ssn: "021234520", phone: "433448711")
  end
  
  def destroy_children
    @alex.destroy
    @rachel.destroy
    @mark.destroy
  end
  
  def create_tasks
    @dishes = FactoryBot.create(:task)
    @wood = FactoryBot.create(:task, name: "Stack wood", active: false)
    @sweep = FactoryBot.create(:task, name: "Sweep floor")
    @shovel = FactoryBot.create(:task, name: "Shovel driveway", points: 3)
    @mow = FactoryBot.create(:task, name: "Mow grass", points: 2)
  end
  
  def destroy_tasks
    @dishes.destroy
    @mow.destroy
    @wood.destroy
    @sweep.destroy
    @shovel.destroy
  end
  
  def create_chores
    @ac1 = FactoryBot.create(:chore, child: @alex, task: @dishes)
    @mc1 = FactoryBot.create(:chore, child: @mark, task: @sweep)
    @ac2 = FactoryBot.create(:chore, child: @alex, task: @sweep, due_on: 2.days.from_now.to_date)
    @mc2 = FactoryBot.create(:chore, child: @mark, task: @dishes, due_on: 2.days.from_now.to_date)
    @ac3 = FactoryBot.create(:chore, child: @alex, task: @shovel, due_on: 2.days.ago.to_date, completed: true)
    @ac4 = FactoryBot.create(:chore, child: @alex, task: @dishes, due_on: Date.today, completed: true)
    @mc3 = FactoryBot.create(:chore, child: @mark, task: @sweep, due_on: Date.today, completed: true)
  end
  
  def destroy_chores
    @ac1.destroy
    @ac2.destroy
    @ac3.destroy
    @ac4.destroy
    @mc1.destroy
    @mc2.destroy
    @mc3.destroy
  end
end