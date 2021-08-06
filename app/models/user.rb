class User < ApplicationRecord
  has_secure_password
  validates_presence_of :email
  validates_uniqueness_of :email

  def generate_access_token
    self.update! api_token: SecureRandom.hex
    self.api_token
  end
end
