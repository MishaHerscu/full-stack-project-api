require 'rails_helper'

RSpec.describe Team do
  def team_params
    {
      name: 'Weapon XI'
    }
  end

  describe 'is correct object' do
    it 'is a team' do
      expect(Team.new).to be_a(Team)
    end
  end

  describe 'associations' do
    def players_association
      described_class.reflect_on_association(:players)
    end

    def games_association
      described_class.reflect_on_association(:games)
    end

    # is associated with player
    it 'has an association with players' do
      expect(players_association).to_not be_nil
      expect(players_association.name).to eq(:players)
    end

    # is associated with game
    it 'has an association with game' do
      expect(games_association).to_not be_nil
      expect(games_association.name).to eq(:games)
    end

    it 'has a set inverse of players' do
      expect(players_association.options[:inverse_of]).to_not be_nil
      expect(players_association.options[:inverse_of]).to eq(:team)
    end

    it 'has a set inverse of games' do
      expect(games_association.options[:inverse_of]).to_not be_nil
      expect(games_association.options[:inverse_of]).to eq(:team)
    end

    # ensure we have correct params
    it 'validates presence of content on creation' do
      expect(Team.create(team_params)).to be_valid
      # expect(Team.create).to be_invalid # CAN HAVE EMPTY TEAM
    end
  end
end
