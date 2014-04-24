class Admin::Spending < ActiveRecord::Base

  validates :name, presence: true

  has_many :products
  belongs_to :user, class_name: User, foreign_key: :created_user_id
end
