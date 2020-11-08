class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :body
      t.integer :chapter_number
      t.integer :book_id, foreign_key: true

      t.timestamps
    end
  end
end
