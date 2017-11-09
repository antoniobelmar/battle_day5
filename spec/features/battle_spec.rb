require_relative "../../app.rb"

Capybara.app = Battle

  feature 'fill names and submitting the form' do
    scenario "player1 name appears" do
      visit("/")
      fill_in :player1, with: "whatever name"
      click_button "Submit"
      expect(page).to have_content "whatever name"
    end

    scenario "player2 name appears" do
      visit("/")
      fill_in :player2, with: "whatever name"
      click_button "Submit"
      expect(page).to have_content "whatever name"
    end
  end

    feature "seeing opponent's hit points" do
      scenario "visiting play page and seeing 60HP" do
        visit("/play")
        expect(page).to have_content "60HP"
      end
    end
