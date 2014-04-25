class Admin::Revenue < ActiveRecord::Base

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}

  has_many :products

  def update_user_balance
    User.all.each do |user|
      user.balance = user.balance - self.amount
      user.save
    end
  end
end
