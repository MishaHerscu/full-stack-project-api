require 'rails_helper'

RSpec.describe 'routes for players' do
  it 'routes POST /new-player to the players#new action' do
    expect(post('/new-player')).to route_to('players#new')
  end

  it 'routes DELETE /delete-player/:id to the players#destroy action' do
    expect(delete('/players/1')).to route_to(
      controller: 'players',
      action: 'destroy',
      id: '1'
    )
  end

  it 'routes PATCH /update-player/:id to the players#update action' do
    expect(patch('/update-player/1')).to route_to(
      controller: 'players',
      action: 'update',
      id: '1'
    )
  end

  it 'routes GET /players to the players#index action' do
    expect(get('/players')).to route_to('players#index')
  end

  it 'routes GET /players/:id to the players#show action' do
    expect(get('/players/1')).to route_to(
      controller: 'players',
      action: 'show',
      id: '1'
    )
  end
end
