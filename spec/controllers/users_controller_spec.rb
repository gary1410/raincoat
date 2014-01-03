require 'spec_helper'
require 'factory_girl'

describe UsersController do 
  before(:each) do
    @user = build(:user)
  end

  it "#index" do
    get :index
    response.status.should eq(200)
  end

  context "#create" do
    it "should create a user with valid params" do
      expect {
        post :create, user: @user.attributes
      }.to change { User.count }.by(1)
    end

    it "shouldn't create a user with invalid params" do
      expect {
        post :create, user: { name: "" }
      }.to_not change { User.count }
    end
  end
end
