require 'rails_helper'

RSpec.describe 'Teams API' do
  def team_params
    {
      name: 'Weapon X'
    }
  end

  after(:each) do
    Team.delete_all
  end

  context 'when authenticated' do
    def headers
      {
        'HTTP_AUTHORIZATION' => "Token token=#{@token}"
      }
    end

    before(:each) do
      post '/teams', team: team_params

      # @token = current_user[:token]
      @team = JSON.parse(response.body)
      @team_id = @team['id']
    end

    describe 'GET /teams' do
      it 'is successful' do
        get '/teams', nil, headers

        expect(response).to be_success

        parsed_response = JSON.parse(response.body)
        expect(
          parsed_response['teams']
        ).not_to be_empty
      end
    end

    describe 'GET /teams/:id' do
      it 'is successful' do
        get "/teams/#{@team_id}", nil, headers

        expect(response).to be_success

        parsed_response = JSON.parse(response.body)
        expect(
          parsed_response['teams']
        ).not_to be_empty
      end
    end
  end

  context 'when not authenticated' do
    describe 'GET /teams' do
      it 'is not successful' do
        get '/teams'

        expect(response).to be_success
      end
    end

    describe 'GET /teams/:id' do
      it 'is not successful' do
        get "/teams/#{@team_id}"

        expect(response).to be_success
      end
    end
  end
end
