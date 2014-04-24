class Admin::Revenue < ActiveRecord::Base

  validates :name, presence: true

  has_many :products
end
