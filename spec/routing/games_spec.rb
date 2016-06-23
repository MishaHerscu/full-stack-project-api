require 'rails_helper'

RSpec.describe 'routes for games' do
  it 'routes POST /new-game to the games#new action' do
    expect(post('/new-game')).to route_to('games#new')
  end

  it 'routes DELETE /delete-game/:id to the games#destroy action' do
    expect(delete('/delete-game/1')).to route_to(
      controller: 'games',
      action: 'destroy',
      id: '1'
    )
  end

  it 'routes PATCH /update-game/:id to the games#update action' do
    expect(patch('/update-game/1')).to route_to(
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
