require 'rails_helper'

RSpec.feature "Creating Exercise" do

  before do
    @test = User.create!(email: "test@test.com", password: "asdfasdf", first_name: "Wesson", last_name: "Smith")
    login_as(@test)
  end
  it "with valid inputs" do
    visit "/"

    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration",  with: 70
    fill_in "Workout Details",  with: "weight lifting"
    fill_in "Activity date",  with: "2016-08-07" 
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created") 

    exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@test, exercise))    
  end
end

