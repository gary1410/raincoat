class User < ActiveRecord::Base
  validates :zipcode, presence: true
  validates :email, presence: true
end
