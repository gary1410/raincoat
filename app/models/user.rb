class User < ActiveRecord::Base
  attr_accessible :password, :password_digest, :zipcode, :email, :name
  has_secure_password
  
  validates :zipcode, presence: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
