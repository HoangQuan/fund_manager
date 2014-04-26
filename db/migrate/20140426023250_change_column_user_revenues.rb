class ChangeColumnUserRevenues < ActiveRecord::Migration
  def change
    remove_column :user_revenues, :user_revenue_id
    add_column :user_revenues, :revenue_id, :integer
  end
end
