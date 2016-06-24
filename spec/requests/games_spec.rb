require 'rails_helper'

RSpec.describe 'Games API' do
  def game_params
    {
      date: '2016-11-15',
      opponent: 1,
      won: 'false'
    }
  end

  after(:each) do
    Game.delete_all
  end

  context 'when authenticated' do
    def headers
      {
        'HTTP_AUTHORIZATION' => "Token token=#{@token}"
      }
    end

    before(:each) do
      post '/games', game: game_params

      # @token = current_user[:token]
      @game_details = JSON.parse(response.body)
      @game_id = JSON.parse(response.body)['game']['id']
    end

    describe 'GET /games' do
      it 'is successful' do
        get '/games', nil, headers

        expect(response).to be_success

        parsed_response = JSON.parse(response.body)
        expect(
          parsed_response['games']
        ).not_to be_empty
      end
    end

    describe 'GET /games/:id' do
      it 'is successful' do
        get "/games/#{@game_id}", nil, headers

        expect(response).to be_success

        parsed_response = JSON.parse(response.body)
        expect(
          parsed_response['game']
        ).not_to be_empty
      end
    end
  end

  context 'when not authenticated' do
    describe 'GET /games' do
      it 'is not successful' do
        get '/games'

        expect(response).not_to be_success
      end
    end

    describe 'GET /games/:id' do
      it 'is not successful' do
        get "/games/#{@game_id}"

        expect(response).not_to be_success
      end
    end
  end
end
