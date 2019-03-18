class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.float :latitude
      t.float :longitude
      t.bool :active

      t.timestamps
    end
  end
end
