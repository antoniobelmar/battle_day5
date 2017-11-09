def sign_in_and_play
  visit("/")
  fill_in :player1, with: "Antonio"
  fill_in :player2, with: "Ignacio"
  click_button "Submit"
end
