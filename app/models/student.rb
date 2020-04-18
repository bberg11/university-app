class Student < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true

  has_secure_password
end
