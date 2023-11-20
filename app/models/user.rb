class User < ApplicationRecord
  before_save {self.email = email.downcase}

  validates :username,
            presence: true,
            length: {minimum: 3, maximum: 20},
            uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence: true,
            length: {minimum: 5, maximum: 40},
            uniqueness: { case_sensitive: false },
            format: {with: VALID_EMAIL_REGEX}
  validates :password_digest, confirmation: true
  has_secure_password
  has_many :bookings

end
