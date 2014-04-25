class CreateUserRevenues < ActiveRecord::Migration
  def change
    create_table :user_revenues do |t|
      t.integer :user_id
      t.integer :user_revenue_id
      t.string :status

      t.timestamps
    end
  end
end
