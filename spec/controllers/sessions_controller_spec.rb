require 'spec_helper'
require 'factory_girl'

describe SessionsController do
  before(:each) do
    @user = create(:user)
  end

  it "#destroy" do
    delete :destroy
    expect(session[:current_user_id]).to be_nil
  end

  context "#create" do

    it "should set session with valid params" do
      post :create, user: {email: @user.email, password: @user.password }
      expect(session[:current_user_id]).to eq(@user.id)
    end

    it "should not set session with invalid params" do
      post :create, user: {email: "email@email.com", password: "foobar"}
      expect(session[:current_user_id]).to eq(nil)
    end
  end

end
