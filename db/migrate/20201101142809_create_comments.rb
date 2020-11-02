class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :cmt_duty_id
      t.string :cmt_duty_type

      t.timestamps
    end
  end
end
