require 'rails_helper'

RSpec.feature 'user sees search results by zipcode' do
  it 'shows results limited to Electric and Propane' do
    # As a user
    # When I visit "/"
    visit(root_path)
    # And I fill in the search form with 80203
    fill_in('q', :with => "80203")
    # And I click "Locate"
    click_button("Locate")
    # Then I should be on page "/search?zip=80203"
    expect(current_path).to eq("/search?zip=80203")
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_content("XXXXX")
    # And the stations should be limited to Electric and Propane
    expect(page).to have_content("Electric")
    expect(page).to have_content("Propane")
    expect(page).to_not have_content("Solar")
    expect(page).to_not have_content("Wind")
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
    within('#STATION-NAME').expect do
      expect(page).to have_content("Name")
      expect(page).to have_content("Address")
      expect(page).to have_content("Fuel Types")
      expect(page).to have_content("Distance")
      expect(page).to have_content("Access Times")
    end
  end
end
