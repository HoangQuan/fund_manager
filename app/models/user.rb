class User < ActiveRecord::Base
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
  scope :order_by_created, ->{order "users.created_at DESC"}
  scope :order_by_updated, ->{order "users.created_at DESC"}
  def large_image
    "http://graph.facebook.com/#{self.uid}/picture?type=large"
  end

  def small_image
    "http://graph.facebook.com/#{self.uid}/picture?type=small"
  end
end
