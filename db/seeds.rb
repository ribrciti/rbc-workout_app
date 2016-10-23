# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |num| 
  User.create!(email: "test_#{num}@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", 
    first_name: "Wesson_#{num}", last_name: "Smith_#{num}")  
end

User.all.each do |user|
  count = 0
  rand(3..6).times do
    
    @min = rand(29..99).to_i
    workout = ["Running", "Backs and Abs", "Weightlifting", "Stationary Bike", "Swimming", "Fitness Bands", "Basketball", "Jumping Jacks", "Heavy Tire"]
    @workout = workout[rand(0..8)]
    @date = (Date.today - count.days)
    count += 1

    user.exercises.create!(duration_in_min: @min, workout: @workout, workout_date: @date)
  end
end
