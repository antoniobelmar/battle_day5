require 'player'

describe Player do

  subject(:player) { described_class.new('Antonio') }

  describe '#initilize' do
    it 'has a name' do
      expect(player.name).to eq 'Antonio'
    end
  end
end
