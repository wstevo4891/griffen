require 'rails_helper'

RSpec.feature "User logs in and logs out" do

  # `js: true` spec metadata means this will run using the `:selenium`
  # browser driver configured in spec/support/capybara.rb
  scenario "with correct details" do

    create(:user, email: "someone@example.tld", password: "zx%-7$6yu23")

    visit root_path

    click_on "new-account-dropdown"
    click_on "user-login"

    expect(current_path).to eq(new_user_session_path)
    expect(page).to have_css("h1", text: "Please Log in")    

    login "someone@example.tld", "zx%-7$6yu23"

    expect(current_path).to eq(root_path)
    expect(page).to have_content "Signed in successfully"

    click_on "account-dropdown"
    click_on "user-logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content "Signed out successfully"
  end

  scenario "unconfirmed user cannot login" do

    create(:user, skip_confirmation: false, email: "e@example.tld", password: "zx%-7$6yu23")

    visit new_user_session_path

    login "e@example.tld", "zx%-7$6yu23"

    expect(current_path).to eq(new_user_session_path)
    expect(page).not_to have_content "Signed in successfully"
    expect(page).to have_content "You have to confirm your email address before continuing"
  end

  scenario "locks account after 10 failed attempts" do

    email = "someone@example.tld"
    create(:user, email: email, password: "zx%-7$6yu23")

    visit new_user_session_path

    (1..8).each do |attempt_num|
      login email, "wrong-password #{attempt_num}"
      expect(page).to have_content "Invalid email or password"
    end

    login email, "wrong-password 9"
    expect(page).to have_content "You have one more attempt before your account is locked"

    login email, "wrong-password 10"
    expect(page).to have_content "Your account is locked."

  end

  private

  def login(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end

end