class User < ApplicationRecord
  has_one :blog
  has_many :comments
  has_secure_password
  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "nieprawidłowy adres e-mail" }
  validates :login, presence: true
  validates :nickname, presence: true

end
