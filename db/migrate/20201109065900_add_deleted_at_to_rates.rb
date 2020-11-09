class AddDeletedAtToRates < ActiveRecord::Migration[6.0]
  def change
    add_column :rates, :deleted_at, :datetime
    add_index :rates, :deleted_at
  end
end
