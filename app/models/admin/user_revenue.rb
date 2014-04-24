class Admin::UserRevenue < ActiveRecord::Base

  belongs_to :user, class_name: Admin::User.name, foreign_key: :user_id
  belongs_to :revenue, class_name: Admin::Revenue.name, foreign_key: :revenue_id
end
