require 'rails_helper'

RSpec.describe GamesController do
  def game_params
    {
      date: '2016-11-15',
      winner: 1,
      loser: 2
    }
  end

  after(:each) do
    Game.delete_all
  end

  describe 'POST new game' do
    before(:each) do
      post :newgame, { credentials: game_params }, format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders a JSON response' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response).not_to be_nil
    end
  end

  describe 'PATCH change game' do
    def new_game_params
      {
        old_date: '2016-11-10',
        new_date: '2016-12-10',
        old_winner: 'foobar',
        new_winner: 'foobarbaz',
        old_loser: 'foobarbaz',
        new_loser: 'foobarbazqux'
      }
    end

    before(:each) do
      patch :change_game,
            { id: @game_id, details: new_game_params },
            format: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'renders no response body' do
      expect(response.body).to be_empty
    end
  end

  describe 'DELETE game' do
    before(:each) do
      delete :delete_game, id: @game_id, format: :json
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
      get :index, id: @game_id, format: :json
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
