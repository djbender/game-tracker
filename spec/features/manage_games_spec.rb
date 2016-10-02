require 'rails_helper'

RSpec.feature "Manage Games", type: :feature do

  scenario "create a game title" do
    visit "/games"
    click_link "Add Game"
    within "#new_game" do
      fill_in :game_title, with: "Final Fantasy XV"
      fill_in :game_price, with: "89.99"
    end

    click_button "Create Game"
    expect(page).to have_content "Game was successfully created"
  end

  context "given a game" do
    given!(:game) { Game.create! title: "Final Fantasy XV", price: "89.99" }

    xscenario "read a game title" do
      visit "/games"
      click_link game.title

      expect(page).to have_content game.title
      expect(page).to have_content "$#{game.price}"
    end

    scenario "update a game title"
    scenario "delete a game title"
  end

end
