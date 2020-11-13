class AddCountViewToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :count_view, :integer, default: 0
  end
end
