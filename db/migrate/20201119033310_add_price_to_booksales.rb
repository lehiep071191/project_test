class AddPriceToBooksales < ActiveRecord::Migration[6.0]
  def change
    add_column :booksales, :price, :integer
  end
end
