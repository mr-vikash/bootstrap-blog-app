class User < ApplicationRecord
  has_many :articles
  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/
  validates :username, presence: true, length: { minimum: 3, maximum: 25 },
            uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 100 },
             uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
end
