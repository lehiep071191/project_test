class AddFieldsToRouters < ActiveRecord::Migration[6.0]
  def change
    add_column :routers, :description, :string
    add_column :routers, :address, :string
  end
end
