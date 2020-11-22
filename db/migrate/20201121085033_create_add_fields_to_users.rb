class CreateAddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :add_fields_to_users do |t|
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
