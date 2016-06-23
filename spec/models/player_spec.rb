require 'rails_helper'

RSpec.describe Player do
  it 'is a player' do
    expect(Player.new).to be_a(Player)
  end
end
