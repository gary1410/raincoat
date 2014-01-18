require 'spec_helper'
require 'factory_girl'

feature "User can login" do
  before(:each) do
    visit root_path
    @user = create(:user)
  end

  xscenario "with valid with saved information", js: true do
    fill_in "session[email]", with: @user.email
    fill_in "session[password]", with: @user.password
    click_button("Login")
    expect(page).to have_content "Hello #{@user.name}!"
  end
end