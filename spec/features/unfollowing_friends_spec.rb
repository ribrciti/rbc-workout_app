require 'rails_helper'

RSpec.feature "Unfollowing a friend" do
  before do
    @john = User.create!(email: "john@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "John", last_name: "Smith")
    @sarah = User.create!(email: "sarah@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Sarah", last_name: "Simpson")
    login_as(@john)

    @e1 = @john.exercises.create!(duration_in_min: 33, workout: "Weightlifting with dumbells", workout_date: Date.today)
    @e2 = @sarah.exercises.create!(duration_in_min: 66, workout: "Ride Platonic Stationary Bike", workout_date: Date.today)

    @following = Friendship.create(user: @john, friend: @sarah)
  end

  scenario "" do
    visit "/"

    click_link("My Lounge")
    link = "a[@href='/friendships/#{@following.id}'][data-method='delete']"
    find(link).click

    expect(page).to have_content(@sarah.full_name + " unfollowed")            
  end
end