class User < ApplicationRecord
    validates :email, :password_digest, :name, :lastname presence: true
    validates :name, :lastname, length:   {in: 2..13}
    
    has_many :posts
    has_many :comments, through: :posts
end
