class CreateSpending < ActiveRecord::Migration
  def change
    create_table :spendings do |t|
      t.string :name
      t.float :amount
      t.string :content
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end
