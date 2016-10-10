require 'rails_helper'

RSpec.feature "Signing users up" do
  scenario "with valid credentials" do
    visit "/"

    click_link "Sign up"
    fill_in "Email", with: "user@test.com"
    fill_in"Password", with: "asdfasdf"
    fill_in"Password confirmation", with: "asdfasdf"
    click_button "Sign up"

    #expect(page).to redirect_to root_path
    expect(page).to have_content("Welcome! You have signed up successfully.") 
  end
end

