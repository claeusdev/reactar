class User < ApplicationRecord
  has_secure_password

  validates :username, :email, :password, presence: true
  validates_uniqueness_of :email, :username
end
