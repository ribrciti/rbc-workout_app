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
    fill_in "Activity date",  with: "2016-10-16" 
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created") 

    exercise = Exercise.last
    expect(page.current_path).to eq(user_exercise_path(@test, exercise))    
  end

  scenario "with invalid inputs" do
    visit "/"
    click_link "My Lounge"
    click_link "New Workout"

    expect(page).to have_content("New Exercise for")
    fill_in "Duration",  with: nil
    fill_in "Workout Details",  with: ""
    fill_in "Activity date",  with: "" 
    click_button "Create Exercise" 

    expect(page).to have_content("Exercise has not been created")
     
    expect(page).to have_content("Duration in min can't be blank")
    expect(page).to have_content("Workout can't be blank")
    expect(page).to have_content("Workout date can't be blank")
  end
end

