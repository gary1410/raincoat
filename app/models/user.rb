class User < ActiveRecord::Base
  validates :zipcode, presence: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
