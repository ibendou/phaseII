class AddForeignKeyToAssignment < ActiveRecord::Migration[5.1]
  def change
    add_column :assignments, :employee_id, :integer
    add_column :assignments, :store_id, :integer
  end
end
