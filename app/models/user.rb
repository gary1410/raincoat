class User < ActiveRecord::Base
  has_secure_password
  
  validates :zipcode, presence: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
