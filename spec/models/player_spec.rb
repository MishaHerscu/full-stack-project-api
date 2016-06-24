require 'rails_helper'

RSpec.describe Player do
  def team_id
    Team.last.id
  end

  def user_id
    User.last.id
  end

  def player_params
    {
      surname: 'Herscu',
      given_name: 'Misha',
      email: 'mishaherscu@gmail.com',
      phone_number: '413-320-6636',
      captain: 'yes',
      team_id: team_id,
      user_id: user_id
    }
  end

  # I had used: Player.first.id

  def team_params
    {
      name: 'Weapon X'
    }
  end

  def user_params
    # email_address = 'misha' + (user_id + 1).to_s + '@gmail.com'
    email_address = 'mishamisha@misha.com'
    {
      email: email_address,
      password: 'foobartwo',
      password_confirmation: 'foobartwo'
    }
  end

  def make_dependency_objects
    User.create!(user_params)
    Team.create!(team_params)
  end

  before(:all) do
    make_dependency_objects
    Player.create!(player_params)
  end

  after(:all) do
    Player.delete_all
    User.delete_all
    Team.delete_all
  end

  describe 'is correct object' do
    it 'is a player' do
      expect(Player.new).to be_a(Player)
    end
  end

  describe 'associations' do
    def team_association
      described_class.reflect_on_association(:team)
    end

    def user_association
      described_class.reflect_on_association(:user)
    end

    # is associated with player
    it 'has an association with team' do
      expect(team_association).to_not be_nil
      expect(team_association.name).to eq(:team)
    end

    # is associated with game
    it 'has an association with user' do
      expect(user_association).to_not be_nil
      expect(user_association.name).to eq(:user)
    end

    it 'has a set inverse of team' do
      expect(team_association.options[:inverse_of]).to_not be_nil
      expect(team_association.options[:inverse_of]).to eq(:players)
    end

    it 'has a set inverse of user' do
      expect(user_association.options[:inverse_of]).to_not be_nil
      expect(user_association.options[:inverse_of]).to eq(:player)
    end

    # ensure we have correct params
    it 'validates presence of content on creation' do
      expect(Player.create(player_params)).to be_valid
      # expect(Player.create).to be_invalid # CAN HAVE EMPTY TEAM
    end
  end
end
