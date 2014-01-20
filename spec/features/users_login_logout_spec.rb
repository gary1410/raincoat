require 'spec_helper'
require 'factory_girl'

feature "User can login" do
  before(:each) do
    visit root_path
    @user = create(:user)
  end

  scenario "with valid with saved information", js: true do
    find("#login-button").click
    fill_in "user[email]", with: @user.email
    fill_in "user[password]", with: @user.password
    click_button("Login")
    expect(page).to have_content "Hello #{@user.name}!"
  end
end