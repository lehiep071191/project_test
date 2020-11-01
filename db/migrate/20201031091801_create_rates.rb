class CreateRates < ActiveRecord::Migration[6.0]
  def change
    create_table :rates do |t|
      t.integer :rating
      t.integer :rate_duty_id
      t.string :rate_duty_type
      t.integer :user_id

      t.timestamps
    end
  end
end
