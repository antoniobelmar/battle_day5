
  feature 'fill names and submitting the form' do
    scenario "player1 name appears" do
      sign_in_and_play
      expect(page).to have_content "Antonio vs. Ignacio"
    end
  end

    feature "seeing opponent's hit points" do
      scenario "visiting play page and seeing 60HP" do
        sign_in_and_play
        expect(page).to have_content "60HP"
      end
    end

    feature "attacking" do
      scenario "attacking player 2 and receive confirmation" do
        sign_in_and_play
        click_button "Attack P2"
        expect(page).to have_content "Your attack was successful."
      end
    end
