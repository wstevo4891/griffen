require 'rails_helper'

feature "Home page" do

  scenario "visit" do
    visit "/"
    expect(page).to have_title "Griffen Financial"
    expect(page).to have_css "h1", text: "The Griffen Credit Card Reader"
  end

end