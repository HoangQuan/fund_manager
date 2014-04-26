class Admin::User < ActiveRecord::Base
  has_many :user_revenues
  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def large_image
    "http://graph.facebook.com/#{self.uid}/picture?type=large"
  end

  def small_image
    "http://graph.facebook.com/#{self.uid}/picture?type=small"
  end

  def create_total_cash money
    cash = Admin::TotalCash.new
    last_cash = Admin::TotalCash.last
    cash.created_user_id = self.id
    cash.current_total_cash = (last_cash.nil? ? 0 : last_cash.current_total_cash + money)
    cash.memo = "Thay đổi: Cộng Thêm #{money} Từ Tài khoản #{self.name}"
    cash.save
  end
end
