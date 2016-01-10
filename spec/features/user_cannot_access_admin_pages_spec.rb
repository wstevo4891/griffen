require 'rails_helper'

RSpec.feature "User cannot access admin page" do
  
  before do
  	create(:user, email: "someone@example.tld", password: "zx%-7$6yu23")
  	visit new_user_session_path
  	login "someone@example.tld", "zx%-7$6yu23"
  end

  scenario "admin dashboard" do
  	visit "/admin"

  	expect(current_path).to eq(new_admin_session_path)
  	expect(page).to have_content("Please Log in")
  end  
  
  scenario "users index" do
  	visit "/users"

  	expect(current_path).to eq(new_admin_session_path)
  	expect(page).to have_content("Please Log in")
  end

  scenario "applications index" do
  	visit "/applications"

  	expect(current_path).to eq(new_admin_session_path)
  	expect(page).to have_content("Please Log in")
  end

  scenario "aches index" do
    visit "/aches"

  	expect(current_path).to eq(new_admin_session_path)
  	expect(page).to have_content("Please Log in")
  end

  scenario "documents index" do
    visit "/documents"

  	expect(current_path).to eq(new_admin_session_path)
  	expect(page).to have_content("Please Log in")
  end

  scenario "orders index" do
    visit "/orders"

  	expect(current_path).to eq(new_admin_session_path)
  	expect(page).to have_content("Please Log in")
  end

  scenario "products index" do
    visit "/products"

  	expect(current_path).to eq(new_admin_session_path)
  	expect(page).to have_content("Please Log in")
  end   
end