require 'rails_helper'

RSpec.describe 'routes for teams' do
  it 'routes POST /new-team to the teams#new action' do
    expect(post('/new-team')).to route_to('teams#new')
  end

  it 'routes DELETE /delete-team/:id to the teams#destroy action' do
    expect(delete('/delete-team/1')).to route_to(
      controller: 'teams',
      action: 'destroy',
      id: '1'
    )
  end

  it 'routes PATCH /update-team/:id to the teams#update action' do
    expect(patch('/change-password/1')).to route_to(
      controller: 'users',
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
