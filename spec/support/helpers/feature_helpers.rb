module FeatureHelpers

  def login(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_on "Log in"
  end

  def login_admin
    @admin = create(:admin, email: "doodlemeister@example.tld", password: "zx%-7$6yu23")
    visit new_admin_session_path
    login("doodlemeister@example.tld", "zx%-7$6yu23")
  end

  def expect_fields_to_be_blank
  	expect(page).to have_field("First Name", with: "")
  	expect(page).to have_field("Last Name", with: "")
  	expect(page).to have_field("Email", with: "")
  	expect(page).to have_field("Business", with: "")
  	expect(page).to have_field("Phone", with: "")
  	# These password fields don't have value attributes in the generated
  	# HTML, so with: syntax doesn't work.
  	expect(find_field("Password", type: "password").value).to be_nil
  	expect(find_field("Password confirmation", type: "password").value).to be_nil
  end
end
