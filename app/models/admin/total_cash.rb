class Admin::TotalCash < ActiveRecord::Base
  validates :current_total_cash, presence: true
  validates :current_total_cash, numericality: true
  validates :memo, presence: true
  belongs_to :user, foreign_key: :created_user_id
end
