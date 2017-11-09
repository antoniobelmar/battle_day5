
  feature 'fill names and submitting the form' do
    scenario "player1 name appears" do
      sign_in_and_play
      expect(page).to have_content "Antonio vs. Ignacio"
    end
  end

    feature "seeing opponent's hit points" do
      scenario "visiting play page and seeing 60HP" do
        visit("/play")
        expect(page).to have_content "60HP"
      end
    end
