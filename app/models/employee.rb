class Employee < ApplicationRecord
    has_many(:assignments)
    validates_presence_of(:first_name, :last_name, :date_of_birth, :ssn, :role)
    validates_date :date_of_birth
    validates_format_of :first_name, with: /\D/
    validates_format_of :last_name, with: /\D/
    validates_format_of :role, with: /\D/
   # validates_format_of :ssn, with: (\d{3}-\d{2}-\d{4})|(\d{3}\d{2}\d{4})$
    #validates_format_of :phone, with: \(?([0-9]{3})\)?[-.●]?([0-9]{3})[-.●]?([0-9]{4})$
end
