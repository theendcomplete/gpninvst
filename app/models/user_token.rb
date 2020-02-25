class UserToken < ApplicationRecord
  belongs_to :user
  self.primary_key = 'token'

  delegate :fcm_topic_name, to: :user

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.hex(64)
  end
end
