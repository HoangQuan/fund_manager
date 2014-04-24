class ChangUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string
    add_column :users, :amount, :float
    add_column :users, :balance, :float
  end
end
