# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |num|
  User.create!(email: "test_#{num}@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", 
    first_name: "Wesson_#{num}", last_name: "Smith_#{num}")
end

puts "10 Users have been created"  