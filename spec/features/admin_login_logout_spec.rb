require 'rails_helper'

RSpec.feature "Admin logs in and logs out" do
  scenario "with correct details" do

    create(:admin, email: "someone@example.tld", password: "zx%-7$6yu23", god_mode: true)

    visit root_path

    click_on "account-page-link"

    expect(current_path).to eq(pages_account_path)

    click_on "LOGIN"

    expect(page).to have_css("h1", text: "Please Log in")
    expect(current_path).to eq(new_user_session_path)

    login "someone@example.tld", "zx%-7$6yu23"

    expect(current_path).to eq(root_path)
    expect(page).to have_content "Signed in successfully"
    expect(page).to have_content "GOD MODE ACTIVE!"

    click_on "admin-dropdown"
    click_on "admin-logout"

    expect(current_path).to eq(root_path)
    expect(page).to have_content "Signed out successfully"    
  end

  private

  def login(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end   
end