require 'rails_helper'

RSpec.describe 'routes for games' do
  it 'routes POST /games to the games#create action' do
    expect(post('/games/')).to route_to('games#create')
  end

  it 'routes DELETE /games/:id to the games#destroy action' do
    expect(delete('/games/1')).to route_to(
      controller: 'games',
      action: 'destroy',
      id: '1'
    )
  end

  it 'routes PATCH /games/:id to the games#update action' do
    expect(patch('/games/1')).to route_to(
      controller: 'games',
      action: 'update',
      id: '1'
    )
  end

  it 'routes GET /games to the games#index action' do
    expect(get('/games')).to route_to('games#index')
  end

  it 'routes GET /games/:id to the games#show action' do
    expect(get('/games/1')).to route_to(
      controller: 'games',
      action: 'show',
      id: '1'
    )
  end
end
