class CreateRevenues < ActiveRecord::Migration
  def change
    create_table :revenues do |t|
      t.string :name
      t.float :amount
      t.string :content

      t.timestamps
    end
  end
end