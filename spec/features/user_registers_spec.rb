require "rails_helper"

RSpec.feature "User registers" do
  scenario "with valid details" do

  	visit root_path
  	click_link "SIGN UP NOW"

  	expect(current_path).to eq(new_user_registration_path)
    
  # VCR.use_cassette('user_registers', record: :new_episodes) do
    VCR.use_cassette('user_registers') do
  	  fill_in("First Name", with: "Jimi")
  	  fill_in("Last Name", with: "Hendrix")
  	  fill_in("Email", with: "tester@example.tld")
  	  fill_in("Business", with: "Hendrix Greens")
  	  fill_in("Phone", with: "777-888-9999")
  	  fill_in("Password", with: "zx%-7$6yu23")
  	  fill_in("Password confirmation", with: "zx%-7$6yu23")  	
  	  click_on "Register"
    end

=begin
  	expect(current_path).to eq(root_path)
  	expect(page).to have_content("A message with a confirmation 
      link has been sent to your email address. Please follow the 
      link to activate your account.")

    open_email "tester@example.tld", with_subject: "Confirmation instructions"
    visit_in_email "Confirm my account"

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content "Your email address has been successfully confirmed."

    fill_in "Email", with: "tester@example.tld"
    fill_in "Password", with: "zx%-7$6yu23"
    click_button "Log in"
=end

    expect(current_path).to eq(root_path)
    expect(page).to have_content "Welcome! You have signed up successfully."
  #  expect(page).to have_content "Signed in successfully."
  end

  context "with invalid details" do

    before do
      visit new_user_registration_path
    end

    scenario "blank fields" do
      
      expect_fields_to_be_blank

      click_on "Register"

      expect(page).to have_error_messages "Firstname can't be blank", 
                                          "Lastname can't be blank", 
                                          "Email can't be blank", 
                                          "Business can't be blank", 
                                          "Phone can't be blank", 
                                          "Password can't be blank" 
                                          # "Password is not strong enough. Consider adding a number, symbols or more letters to make it stronger."
    end

    scenario "incorrect password confirmation" do
  	  fill_in("First Name", with: "Jimi")
  	  fill_in("Last Name", with: "Hendrix")
  	  fill_in("Email", with: "jimi@hendrixgreens.com")
  	  fill_in("Business", with: "Hendrix Greens")
  	  fill_in("Phone", with: "777-888-9999")
  	  fill_in("Password", with: "zx%-7$6yu23")
  	  fill_in("Password confirmation", with: "the-wrong-thing")  	
  	  click_on "Register"

  	  expect(page).to have_error_message "Password confirmation doesn't match Password"
  	end

  	scenario "already registered email" do

  	  create(:user, email: "jimi@hendrixgreens.com")

  	  fill_in("First Name", with: "Jimi")
  	  fill_in("Last Name", with: "Hendrix")      
      fill_in("Email", with: "jimi@hendrixgreens.com")
  	  fill_in("Business", with: "Hendrix Greens")
  	  fill_in("Phone", with: "777-888-9999")      
      fill_in("Password", with: "zx%-7$6yu23")
      fill_in("Password confirmation", with: "zx%-7$6yu23")
      click_on "Register"

      expect(page).to have_error_message "Email has already been taken"
    end

    scenario "invalid email" do

  	  fill_in("First Name", with: "Jimi")
  	  fill_in("Last Name", with: "Hendrix")      
      fill_in("Email", with: "invalid-email-for-testing")
  	  fill_in("Business", with: "Hendrix Greens")
  	  fill_in("Phone", with: "777-888-9999")
      fill_in("Password", with: "zx%-7$6yu23")
      fill_in("Password confirmation", with: "zx%-7$6yu23")
      click_on "Register"

      expect(page).to have_error_message "Email is invalid"
    end

    scenario "too short password" do

  	  fill_in("First Name", with: "Jimi")
  	  fill_in("Last Name", with: "Hendrix")      
      fill_in("Email", with: "jimi@hendrixgreens.com")
  	  fill_in("Business", with: "Hendrix Greens")
      fill_in("Phone", with: "777-888-9999")
      fill_in("Password", with: "z8%$6")
      fill_in("Password confirmation", with: "z8%$6")
      click_on "Register"

      expect(page).to have_error_message "Password is too short (minimum is 8 characters)"
    end
  end
end
