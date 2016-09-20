class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :restaurant_id
      t.integer :rating, null: false
      t.string :body

      t.timestamps(null: false)
    end
  end
end
