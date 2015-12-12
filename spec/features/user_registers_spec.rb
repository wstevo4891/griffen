require "rails_helper"

RSpec.feature "User registers" do
  scenario "with valid details" do

  	visit root_path
  	click_link "SIGN UP NOW"

  	expect(current_path).to eq(new_user_path)

  	fill_in("First Name", with: "Jimi")
  	fill_in("Last Name", with: "Hendrix")
  	fill_in("Email", with: "tester@example.tld")
  	fill_in("Business", with: "Hendrix Greens")
  	fill_in("Phone", with: "777-888-9999")
  	fill_in("Password", with: "test-password")
  	fill_in("Password confirmation", with: "test-password")  	
  	click_on "Register"

  	expect(current_path).to eq(user_path)
  	expect(page).to have_content("Thank you for registering")
  end

  context "with invalid details" do

    before do
      visit new_user_path
    end

    scenario "blank fields" do
      
      expect_fields_to_be_blank

      click_on "Register"

      expect(page).to have_error_messages "Firstname can't be blank", 
      "Lastname can't be blank", "Email can't be blank", "Business can't 
      be blank", "Phone can't be blank", "Password can't be blank"
    end

    scenario "incorrect password confirmation" do
  	  fill_in "First Name", with: "Jimi"
  	  fill_in "Last Name", with: "Hendrix"
  	  fill_in "Email", with: "jimi@hendrixgreens.com"
  	  fill_in "Business", with: "Hendrix Greens"
  	  fill_in "Phone", with: "777-888-9999"
  	  fill_in "Password", with: "test-password"
  	  fill_in "Password confirmation", with: "not-test-password"  	
  	  click_on "Register"

  	  expect(page).to have_error_message "Password confirmation doesn't 
  	  match Password"
  	end

  	scenario "already registered email" do

  	  create(:user, email: "joe@example.tld")

  	  fill_in "First Name", with: "Jimi"
  	  fill_in "Last Name", with: "Hendrix"      
      fill_in "Email", with: "joe@example.tld"
  	  fill_in "Business", with: "Hendrix Greens"
  	  fill_in "Phone", with: "777-888-9999"      
      fill_in "Password", with: "test-password"
      fill_in "Password confirmation", with: "test-password"

      expect(page).to have_error_message "Email has already been taken"
    end

    scenario "invalid email" do

  	  fill_in "First Name", with: "Jimi"
  	  fill_in "Last Name", with: "Hendrix"      
      fill_in "Email", with: "invalid-email-for-testing"
  	  fill_in "Business", with: "Hendrix Greens"
  	  fill_in "Phone", with: "777-888-9999"      
      fill_in "Password", with: "test-password"
      fill_in "Password confirmation", with: "test-password"

      expect(page).to have_error_message "Email is invalid"
    end

    scenario "too short password" do

      min_password_length = 8
      too_short_password = "p" * (min_password_length - 1)
  	  fill_in "First Name", with: "Jimi"
  	  fill_in "Last Name", with: "Hendrix"      
      fill_in "Email", with: "jimi@hendrixgreens.com"
  	  fill_in "Business", with: "Hendrix Greens"
      fill_in "Phone", with: "777-888-9999"      
      fill_in "Password", with: "too-short-password"
      fill_in "Password confirmation", with: "too_short_password"

      expect(page).to have_error_message "Password is too short 
      (minimum is 8 characters)"
    end
  end

  private

  def expect_fields_to_be_blank
  	expect(page).to have_field("First Name", with: "")
  	expect(page).to have_field("Last Name", with: "")
  	expect(page).to have_field("Email", with: "", type: "email")
  	expect(page).to have_field("Business", with: "")
  	expect(page).to have_field("Phone", with: "")
  	# These password fields don't have value attributes in the generated
  	# HTML, so with: syntax doesn't work.
  	expect(find_field("Password", type: "password").value).to be_nil
  	expect(find_field("Password confirmation", type: "password").value).to be_nil
  end

end




