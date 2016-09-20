class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.integer :creator_id
      t.string :name, null: false
      t.string :cuisine, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zip_code, null: false

      t.timestamps(null: false)
    end
  end
end
