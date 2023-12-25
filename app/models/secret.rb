class Secret < ApplicationRecord
  validates :content, presence: true
  has_secure_token :access_token, length: 36
end
