require 'rails_helper'

RSpec.describe User do
  def user_params
    {
      email: 'alice@example.com',
      password: 'foobarbaz',
      password_confirmation: 'foobarbaz'
    }
  end

  describe 'is correct object' do
    it 'is a user' do
      expect(User.new).to be_a(User)
    end
  end

  describe 'associations' do
    def player_association
      described_class.reflect_on_association(:player)
    end

    # is associated with player
    it 'has an association with player' do
      expect(player_association).to_not be_nil
      expect(player_association.name).to eq(:player)
    end

    it 'has a set inverse of' do
      expect(player_association.options[:inverse_of]).to_not be_nil
      expect(player_association.options[:inverse_of]).to eq(:user)
    end

    # ensure we have correct params
    it 'validates presence of content on creation' do
      expect(User.create(user_params)).to be_valid
      expect(User.create).to be_invalid
    end
  end
end
