class CreateCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :carts do |t|
      t.integer :user_id, foreign_key: true
      t.integer :content

      t.timestamps
    end
  end
end
