class ChangeContentToBeStringInCarts < ActiveRecord::Migration[6.0]
  def change
  	change_column :carts, :content, :string
  end
end
