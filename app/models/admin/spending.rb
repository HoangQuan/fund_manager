class Admin::Spending < ActiveRecord::Base

  validates :name, presence: true

  has_many :products
  belongs_to :user, foreign_key: :created_user_id

  validates :amount, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}

  has_many :products

  def create_total_cash
    cash = Admin::TotalCash.new
    last_cash = Admin::TotalCash.last
    cash.created_user_id = self.user.id
    cash.current_total_cash = (last_cash.nil? ? 0 : last_cash.current_total_cash - self.amount)
    cash.memo = "Thay đổi: Trừ đi tiền #{self.name} số tiền #{self.amount}"
    binding.pry
    cash.save
  end
end
