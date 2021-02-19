class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    validates :email, :password_digest, :name, :lastname, presence: true
    validates :name, :lastname, length:   {in: 2..13}
    
    has_many :posts
    has_many :comments, through: :posts
end
