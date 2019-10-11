class User < ActiveRecord::Base
  has_secure_password
  has_many :recipes
  validates :email, presence: true
  validates :password, presence: true
end
