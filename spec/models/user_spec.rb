require 'spec_helper'

describe User do
  it { should validate_presence_of :zipcode }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_presence_of :name }
  it { should validate_presence_of :latitude }
  it { should validate_presence_of :longitude }
  it { should have_secure_password }
  it { should respond_to(:authenticate) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
end