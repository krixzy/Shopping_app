class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6}
    validates :username, presence: true, uniqueness: true
    validates :password, confirmation: true
    has_many :lists, dependent: :destroy

end
