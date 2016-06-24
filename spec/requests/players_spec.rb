require 'rails_helper'

RSpec.describe 'Players API' do
  def player_params
    {
      surname: 'Herscu',
      given_name: 'Misha',
      email: 'mishaherscu@gmail.com',
      phone_number: '413-320-6636',
      captain: 'yes',
      team_id: '',
      user_id: ''
    }
  end

  after(:each) do
    Player.delete_all
  end

  context 'when authenticated' do
    def headers
      {
        'HTTP_AUTHORIZATION' => "Token token=#{@token}"
      }
    end

    before(:each) do
      post '/players', player: player_params

      @token = current_user[:token]
      @players = JSON.parse(response.body)
      @player_id = JSON.parse(response.body)['player']['id']
    end

    describe 'GET /players' do
      it 'is successful' do
        get '/players', nil, headers

        expect(response).to be_success

        parsed_response = JSON.parse(response.body)
        expect(
          parsed_response['players']
        ).not_to be_empty
      end
    end

    describe 'GET /players/:id' do
      it 'is successful' do
        get "/players/#{@player_id}", nil, headers

        expect(response).to be_success

        parsed_response = JSON.parse(response.body)
        expect(
          parsed_response['player']
        ).not_to be_empty
      end
    end
  end

  context 'when not authenticated' do
    describe 'GET /players' do
      it 'is not successful' do
        get '/players'

        expect(response).not_to be_success
      end
    end

    describe 'GET /players/:id' do
      it 'is not successful' do
        get "/players/#{@player_id}"

        expect(response).not_to be_success
      end
    end
  end
end
