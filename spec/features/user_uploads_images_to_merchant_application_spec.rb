require 'rails_helper'

RSpec.feature "User uploads images to merchant application" do
  scenario "with valid details" do
    create(:user, email: "someone@example.tld", password: "zx%-7$6yu23")

    visit root_path

    click_on "new-account-dropdown"
    click_on "user-login"    

    login "someone@example.tld", "zx%-7$6yu23"
    
    visit new_application_path

  	fill_in("First Name", with: "Jimi")
  	fill_in("Last Name", with: "Hendrix")
  	fill_in("Email", with: "tester@example.tld")
  	fill_in("Business", with: "Hendrix Greens")
  	fill_in("Phone", with: "777-888-9999")

    attach_file(:voidcheck) { Images.image_path("salt_flats.jpg") }
    click_on "SUBMIT"

    expect(@application.voidcheck).to eq("salt_flats.jpg")
  end
end

