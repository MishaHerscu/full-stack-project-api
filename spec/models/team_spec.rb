require 'rails_helper'

RSpec.describe Team do
  it 'is a team' do
    expect(Team.new).to be_a(Team)
  end
end
