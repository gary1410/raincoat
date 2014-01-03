require 'spec_helper'
require 'factory_girl'

feature "User sign up" do
  before(:each) do
    visit root_path
    @user = build(:user)
  end

  scenario "with valid information", js: true do
    fill_in "user[name]", with: @user.name
    fill_in "user_zipcode", with: @user.zipcode
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button("Submit")
    expect(page).to have_content "Hello #{@user.name}!"
  end
end