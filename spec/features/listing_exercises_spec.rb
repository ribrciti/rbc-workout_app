require 'rails_helper'

RSpec.feature "Listing Exercises" do
  before do
    @test = User.create!(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Wesson", last_name: "Smith")
    login_as(@test)

    @e1 = @test.exercises.create!(duration_in_min: 33, workout: "Weightlifting with dumbells", workout_date: Date.today)
    @e2 = @test.exercises.create!(duration_in_min: 66, workout: "Ride Platonic Stationary Bike", workout_date: Date.today)

  end

  scenario "shows user's workout for last 7 days" do 
    visit "/"
    
    click_link("My Lounge")

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)

    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)    
  end  
end