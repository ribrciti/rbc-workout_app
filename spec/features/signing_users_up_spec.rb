require 'rails_helper'

RSpec.feature "Signing users up" do
  scenario "with valid credentials" do
    visit "/"

    click_link "Sign up"
    fill_in "First name",    with: "Smith"
    fill_in "Last name",    with: "Wesson"  
    fill_in "Email", with: "user@test.com"
    fill_in"Password", with: "asdfasdf"
    fill_in"Password confirmation", with: "asdfasdf"
    click_button "Sign up"

    expect(current_path).to eq(root_path) 
    expect(page).to have_content("You have signed up successfully.")
    visit "/"
    
    expect(page).to have_content("Smith Wesson")
      
  end
end

