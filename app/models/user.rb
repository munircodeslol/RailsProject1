class User < ApplicationRecord
    has_many :game_users
    has_many :games, through: :game_users

    validates :username, presence: true, length: {minimum: 3, maximum: 25}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 8, maximum: 125},
                        format:{with: VALID_EMAIL_REGEX}

    has_secure_password

end