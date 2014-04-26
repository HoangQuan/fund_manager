class Admin::Revenue < ActiveRecord::Base

  validates :name, presence: true
  validates :amount, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}

  has_many :user_revenues, dependent: :destroy

  has_many :products

  def update_user_balance
    User.all.each do |user|
      user.balance = user.balance - self.amount
      user.save
    end
  end
  def create_user_revences
    User.all.each do |user|
      user_revenue = self.user_revenues.build(user_id: user.id, status: "Chưa Nộp")
      user_revenue.save
    end
  end
end
