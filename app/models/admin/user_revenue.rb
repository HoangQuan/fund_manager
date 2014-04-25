class Admin::UserRevenue < ActiveRecord::Base

  belongs_to :user, foreign_key: :user_id
  belongs_to :revenue, foreign_key: :revenue_id
end
