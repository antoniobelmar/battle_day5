require 'game'

describe Game do
  let(:player1) { double(:player1, reduce_hp: 'reduced!') }
  let(:player2) { double(:player2, reduce_hp: 'reduced!') }

  subject(:game) { described_class.new(player1, player2) }

  describe "#initialize" do
    it "accepts two arguments when initializing" do
      expect(Game).to respond_to(:new).with(2).arguments
    end

    it "expects to first argument to be stored as player 1" do
      expect(game.player1).to eq(player1)
    end

    it "expects to first argument to be stored as player 2" do
      expect(game.player2).to eq(player2)
    end
  end

  describe "#attack" do
    it "calls reduce_hp on player2" do
      expect(player2).to receive(:reduce_hp)
      game.attack_p2
    end
    it "returns the updated hp points" do
      expect(game.attack_p2).to eq 'reduced!'
    end
  end
end
