require 'rails_helper'

RSpec.describe GamesController do
  def game_params
    {
      date: '2016-11-15',
      opponent: 2,
      won: 'true'
    }
  end

  def games_user_params
    {
      email: 'game_user_2@example.com',
      password: 'foobarbaz_game_2',
      password_confirmation: 'foobarbaz_game_2'
    }
  end

  before(:all) do
    User.create!(games_user_params)
    post '/sign-in', { credentials: games_user_params }, format: :json
    @current_user = User.find_by email: games_user_params[:email]
    @token = @current_user[:token]
  end

  after(:all) do
    User.delete_all
  end

  def game
    Game.first
  end

  before(:all) do
    Game.create!(game_params)
  end

  after(:all) do
    Game.delete_all
  end

  describe 'POST new game' do
    before(:each) do
      post :create, { game: game_params }, format: :json
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
        date: '2016-12-10',
        opponent: 2,
        won: 'false'
      }
    end

    before(:each) do
      patch :update,
            { id: game.id, new_game_details: new_game_params },
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
      delete :destroy, id: game.id, format: :json
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
      get :index, id: game.id, format: :json
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
