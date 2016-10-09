require 'rails_helper'

RSpec.feature "Creating Home Page" do

  it "can be reached successfully" do    
    visit "/"
    
    expect(page).to have_link('Athletes Den')
    expect(page).to have_link("Home")
    expect(page).to have_content("Workout Lounge") 
  end
end
