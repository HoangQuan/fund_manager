class CreateTotalCash < ActiveRecord::Migration
  def change
    create_table :total_cashes do |t|
      t.float :current_total_cash, default: 0
      t.integer :log_id
      t.integer :created_user_id
      t.string :memo

      t.timestamps
    end
  end
end
