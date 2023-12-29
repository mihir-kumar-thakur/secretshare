class Secret < ApplicationRecord
  validates :message, presence: true, unless: :burned
  has_secure_token :token, length: 36
end
