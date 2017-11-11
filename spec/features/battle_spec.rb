
  feature 'fill names and submitting the form' do
    scenario "player1 name appears" do
      sign_in_and_play
      expect(page).to have_content "Antonio"
    end
    scenario "player2 name appears" do
      sign_in_and_play
      expect(page).to have_content "Ignacio"
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
        click_button "Attack"
        expect(page).to have_content "Your attack was successful."
      end

      scenario "when attacking first_time, reduce player 2 HP by 10" do
        sign_in_and_play
        click_button "Attack"
        expect(page).to have_content "Ignacio: (50/60HP)"
      end

      scenario "when attacking second_time, reduce player 1 HP by 10" do
        sign_in_and_play
        click_button "Attack"
        visit "/play"
        click_button "Attack"
        expect(page).to have_content "Antonio: (50/60HP)"
      end

      scenario "when attacking a third time, reduce player 2 HP by 20" do
        sign_in_and_play
        click_button "Attack"
        2.times do
          visit "/play"
          click_button "Attack"
        end
        expect(page).to have_content "Ignacio: (40/60HP)"
      end
    end
