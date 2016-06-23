require 'rails_helper'

RSpec.describe 'routes for teams' do
  it 'routes POST /teams to the teams#create action' do
    expect(post('/teams')).to route_to('teams#create')
  end

  it 'routes DELETE /teams/:id to the teams#destroy action' do
    expect(delete('/teams/1')).to route_to(
      controller: 'teams',
      action: 'destroy',
      id: '1'
    )
  end

  it 'routes PATCH /teams/:id to the teams#update action' do
    expect(patch('/teams/1')).to route_to(
      controller: 'teams',
      action: 'update',
      id: '1'
    )
  end

  it 'routes GET /teams to the teams#index action' do
    expect(get('/teams')).to route_to('teams#index')
  end

  it 'routes GET /teams/:id to the teams#show action' do
    expect(get('/teams/1')).to route_to(
      controller: 'teams',
      action: 'show',
      id: '1'
    )
  end
end
