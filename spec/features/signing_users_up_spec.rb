require 'rails_helper'

RSpec.feature "Signing users up" do
    scenario "with invalid credentials" do
    visit "/"

    click_link "Sign up"
    fill_in "First name",    with: ""
    fill_in "Last name",    with: ""  
    fill_in "Email", with: "user@test.com"
    fill_in"Password", with: "asdfasdf"
    fill_in"Password confirmation", with: "asdfasdf"
    click_button "Sign up"

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end
  
  scenario "with valid credentials" do
    visit "/"

    click_link "Sign up"
    fill_in "First name",    with: "Bob"
    fill_in "Last name",    with: "Jones"  
    fill_in "Email", with: "user2@test.com"
    fill_in"Password", with: "asdfasdf"
    fill_in"Password confirmation", with: "asdfasdf"
    click_button "Sign up"

    expect(current_path).to eq(root_path) 
    expect(page).to have_content("You have signed up successfully.")
    visit "/"
    
    expect(page).to have_content("Bob Jones")      
  end
end

