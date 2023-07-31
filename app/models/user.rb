class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :game_users
  has_many :games, through: :game_users

  validates :username, presence: true, length: {minimum: 3, maximum: 25}

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  # validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 8, maximum: 125},
  #                     format:{with: VALID_EMAIL_REGEX}

  # has_secure_password

end