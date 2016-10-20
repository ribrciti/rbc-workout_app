require 'rails_helper'

RSpec.feature "Signing out signed-in users" do
  before do
    @test = User.create!(email: "test@test.com", password: "asdfasdf", first_name: "Smith", last_name: "Wesson")

    visit "/"
    click_link "Sign in"
    fill_in "Email", with: @test.email
    fill_in "Password", with: @test.password
    click_button "Log in" 
  end

  scenario "sign-out" do
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully") 
    expect(current_path).to eq(root_path) 
  end
end
  
