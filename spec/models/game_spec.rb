require 'rails_helper'

RSpec.describe Game do
  it 'is a game' do
    expect(Game.new).to be_a(Game)
  end
end
