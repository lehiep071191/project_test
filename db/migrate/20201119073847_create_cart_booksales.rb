class CreateCartBooksales < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_booksales do |t|
      t.integer :cart_id
      t.integer :booksale_id

      t.timestamps
    end
  end
end
