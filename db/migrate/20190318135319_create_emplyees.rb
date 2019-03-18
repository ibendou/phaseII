class CreateEmplyees < ActiveRecord::Migration[5.1]
  def change
    create_table :emplyees do |t|
      t.string :first_name
      t.string :last_name
      t.string :ssn
      t.date :date_of_birth
      t.string :phone
      t.string :role
      t.bool :active

      t.timestamps
    end
  end
end
