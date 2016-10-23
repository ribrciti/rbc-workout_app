require 'rails_helper'

RSpec.feature "Following Friends" do
  before do
   @john = User.create(first_name: "John", last_name: "Doe", email: "john@example.com", 
                       password: "asdfasdf", password_confirmation: "asdfasdf")
   @sally = User.create(first_name: "Sally", last_name: "Belle", email: "sally@example.com", 
                       password: "asdfasdf", password_confirmation: "asdfasdf")

   login_as(@john)
  end

  scenario "if signed in succeeds" do
    visit "/"
        
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sally.full_name)
    expect(page).not_to have_link('Follow', :href => "/friendships?friend_id=#{@john.id}")

    link = "a[href='/friendships?friend_id=#{@sally.id}']"
    find(link).click

    expect(page).not_to have_link("Follow", :href => "/friendships?friend_id#{@sally.id}") 
  end
end