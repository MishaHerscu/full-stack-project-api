require 'rails_helper'

RSpec.describe Game do
  def game_params
    {
      date: '2016-11-15',
      opponent: 2,
      won: 'true'
    }
  end

  describe 'is correct object' do
    it 'is a game' do
      expect(Game.new).to be_a(Game)
    end
  end

  describe 'associations' do
    def team_association
      described_class.reflect_on_association(:team)
    end

    # is associated with team
    it 'has an association with team' do
      expect(team_association).to_not be_nil
      expect(team_association.name).to eq(:team)
    end

    it 'has a set inverse of' do
      expect(team_association.options[:inverse_of]).to_not be_nil
      expect(team_association.options[:inverse_of]).to eq(:games)
    end

    # ensure we have correct params
    it 'validates presence of content on creation' do
      expect(Game.create(game_params)).to be_valid
      # expect(Game.create).to be_invalid # I CAN CREATE AN EMPTY GAME
    end
  end
end
