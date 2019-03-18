FactoryBot.define do
  
  # TODO: fill in factory blueprint for children
  factory :employee do
    first_name "Alex"
    last_name "Heimann"
    ssn "023649320"
    date_of_birth 1993-01-25 
    phone "4122688211"
    role "admin"
    active true
  end

  # factory blueprint for tasks
  factory :store do
    name "CMU"
    street "5001 Forbes Ave"
    state "PA"
    zip "15213"
    phone "4122683259"
    latitude 40.453278 
    longitude -80.002322 
    active true
  end

  # factory blueprint for chores
  factory :assignment do
    association :store
    association :employee
    start_date 2012-01-01
    end_date 
    pay_level 4
  end
end