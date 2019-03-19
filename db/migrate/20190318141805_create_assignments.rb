class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.date :start_date
      t.date :end_date
      t.integer :pay_level

      t.timestamps
    end
  end
end
