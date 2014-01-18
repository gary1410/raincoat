require 'spec_helper'
require 'factory_girl'

describe SessionsController do
  before(:each) do
    @user = create(:user)
  end

  it "#destroy" do
    delete :destroy, id: { email: @user.email, password: @user.password }
    expect(session[:current_user_id]).to be_nil
  end

end
