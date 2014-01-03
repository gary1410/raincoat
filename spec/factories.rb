require 'spec_helper'

FactoryGirl.define do
  factory :user do
    password { Faker::Internet.password}
    name { Faker::Name.name}
    email { Faker::Internet.email}
    zipcode { Faker::Address.zip_code}
  end
end

