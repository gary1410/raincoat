class User < ActiveRecord::Base
  attr_accessible :password, :password_digest, :zipcode, :email, :name, :latitude, :longitude, :address, :city, :country
  has_secure_password

  validates :zipcode, presence: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true

  geocoded_by :zipcode
  before_validation :geocode

  reverse_geocoded_by :latitude, :longitude do |obj, results|
    if geo = results.first
      obj.city = geo.city
      obj.country = geo.country_code
    end
  end

  after_validation :reverse_geocode

  def display_city
    if self.city != "Comani"
      return "<h1>Current Location: #{self.city}</h1>".html_safe
    end
  end
end