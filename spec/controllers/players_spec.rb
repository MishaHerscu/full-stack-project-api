require 'rails_helper'

RSpec.describe PlayersController do
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
    {
      email: 'misha@example.com',
      password: 'foobartwo',
      password_confirmation: 'foobartwo'
    }
  end

  def player
    Player.last
  end

  before(:all) do
    User.create!(user_params)
    Team.create!(team_params)
    Player.create!(player_params)
  end

  after(:all) do
    User.delete_all
    Team.delete_all
    Player.delete_all
  end

  describe 'POST new player' do
    before(:each) do
      post :create, { player: player_params }, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_nil
    end
  end

  describe 'PATCH update player info' do
    def new_player_params
      {
        surname: 'Herscu',
        given_name: 'Misha',
        email: 'mishaherscu@gmail.com',
        phone_number: '413-320-6636',
        captain: 'no',
        team_id: team_id,
        user_id: user_id
      }
    end

    before(:each) do
      patch :update,
            { id: player.id, new_player_details: new_player_params },
            format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders no response body' do
      expect(response.body).to be_empty
    end
  end

  describe 'DELETE delete player' do
    before(:each) do
      delete :destroy, id: player.id, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders no response body' do
      expect(response.body).to be_empty
    end
  end

  describe 'GET index' do
    before(:each) do
      get :index, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_nil
    end
  end

  describe 'GET show' do
    before(:each) do
      get :index, id: player.id, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_nil
    end
  end
end
