require 'spec_helper'
require 'factory_girl'

feature "User sign up" do
  before(:each) do
    visit root_path
    @user = build(:user)
  end

  scenario "with valid information", js: true do
    fill_in "user[name]", with: @user.name
    click_button("name-submit")
    fill_in "user_zipcode", with: @user.zipcode
    click_button("zipcode-submit")
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button("Submit")
    expect(page).to have_content "Hello #{@user.name}!"
  end

  scenario "shows city when not Comani", js: true do
    fill_in "user[name]", with: @user.name
    click_button("name-submit")
    fill_in "user_zipcode", with: @user.zipcode
    click_button("zipcode-submit")
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button("Submit")
    expect(page).to have_content "#{@user.city}"
  end
end