require 'rails_helper'

RSpec.feature "Listing Members" do
  before do
    @smith = User.create!(email: "smith@test.com", password: "asdfasdf", first_name: "Wesson", last_name: "Smith")
    @barrett = User.create!(email: "barrett@test.com", password: "asdfasdf", first_name: "Barrett", last_name: "Jackson")
    @bonny = User.create!(email: "bonny@test.com", password: "asdfasdf", first_name: "Bonny", last_name: "Clyde")
  end

  scenario "shows a list of registered members" do
     visit "/"

      expect(page).to have_content("List of Members")
      expect(page).to have_content(@smith.full_name)
      expect(page).to have_content(@barrett.full_name)
      expect(page).to have_content(@bonny.full_name)         
  end
end