class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :blog
  has_many :comments
  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "nieprawidłowy adres e-mail" }
  # validates :login, presence: true
  # validates :nickname, presence: true

end
