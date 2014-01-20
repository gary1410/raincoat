require 'spec_helper'
require 'factory_girl'

feature "User sign up" do
  before(:each) do
    visit root_path
    @user = build(:user)
  end

  xscenario "with valid information", js: true do
    fill_in "user[name]", with: @user.name
    click_button("name-submit")
    fill_in "user_zipcode", with: @user.zipcode
    click_button("zipcode-submit")
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button("Submit")
    expect(page).to have_content "Hello #{@user.name}"
  end

  scenario "with valid information, shows city when not Comani", js: true do
    fill_in "user[name]", with: @user.name
    click_button("name-submit")
    fill_in "user_zipcode", with: @user.zipcode
    click_button("zipcode-submit")
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button("Submit")
    expect(page).to have_content "#{@user.city}"
  end

  scenario "session is created on signup", js: true do
    session_user = create(:user)
    page.set_rack_session(:current_user_id => session_user.id)
    visit root_path
    expect(page).to have_content "Hello #{session_user.name}!"
  end
end