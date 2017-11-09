require 'game'

describe Game do

  subject(:game) { described_class.new }
  let(:player2) { double(:player2, reduce_hp: 'reduced!') }

  describe "#attack" do
    it "calls reduce_hp on player2" do
      expect(player2).to receive(:reduce_hp)
      subject.attack(player2)
    end
    it "returns the updated hp points" do
      expect(subject.attack(player2)).to eq 'reduced!'
    end
  end
end
