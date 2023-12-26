class Secret < ApplicationRecord
  validates :message, presence: true
  has_secure_token :token, length: 36
end
