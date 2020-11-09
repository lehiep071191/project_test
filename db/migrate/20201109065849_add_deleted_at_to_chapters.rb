class AddDeletedAtToChapters < ActiveRecord::Migration[6.0]
  def change
    add_column :chapters, :deleted_at, :datetime
    add_index :chapters, :deleted_at
  end
end
