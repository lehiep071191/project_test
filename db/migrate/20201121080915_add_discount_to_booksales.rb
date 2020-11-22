class AddDiscountToBooksales < ActiveRecord::Migration[6.0]
  def change
    add_column :booksales, :discount, :integer
  end
end
