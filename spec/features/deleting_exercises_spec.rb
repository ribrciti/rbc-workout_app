require 'rails_helper'

RSpec.feature "Deleting Exercises" do

  before do
    @owner = User.create(email: "owner@test.com", password: "asdfasdf", first_name: "Sell", last_name: "Owner")

    @owner_exer = @owner.exercises.create!(duration_in_min: 45, workout: "Cardio Activity", workout_date: Date.today)
    login_as(@owner)
  end

   scenario "with proper credentials a user deletes an exercise" do
    visit "/"

    click_link "My Lounge"
    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exer.id}') and .//text()='Delete']"
    find(:xpath, link).click
    
    expect(page).to have_content("Exercise has been deleted")
  end 
end

