require 'player'

describe Player do

  let(:player1) { described_class.new('Antonio') }
  let(:player2) { described_class.new('Ignacio') }

  describe '#initilize' do
    it 'has a name' do
      expect(player1.name).to eq 'Antonio'
    end
  end

  describe "#attack" do
    it "reduces hit points by 10" do
      expect { player1.attack(player2) }.to change { player2.hp }.by(-10)
    end
  end
end
