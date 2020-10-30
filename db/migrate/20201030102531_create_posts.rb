class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :content
      t.integer :user_id, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
