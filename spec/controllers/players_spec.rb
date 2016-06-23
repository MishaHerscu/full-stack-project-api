require 'rails_helper'

RSpec.describe PlayersController do
  def player_params
    {
      surname: 'Herscu',
      given_name: 'Misha',
      email: 'mishaherscu@gmail.com',
      phone_number: '413-320-6636',
      captain: 'yes',
      team_id: 1,
      user_id: 1
    }
  end

  after(:each) do
    Player.delete_all
  end

  describe 'POST new player' do
    before(:each) do
      post :newplayer, { credentials: player_params }, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_nil
    end
  end

  describe 'PATCH update profile info' do
    def new_player_params
      {
        new_surname: 'Herscu',
        new_given_name: 'Misha',
        new_email: 'mishaherscu@gmail.com',
        new_phone_number: '413-320-6636',
        new_captain: 'yes',
        new_team_id: 1,
        new_user_id: 1
      }
    end

    before(:each) do
      patch :change_player,
            { id: @player_id, details: new_player_params },
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
      delete :signout, id: @player_id, format: :json
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
      get :index, id: @player_id, format: :json
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
