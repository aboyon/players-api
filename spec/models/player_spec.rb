require 'rails_helper'

describe Player, type: :model do
  let(:player) { create :player }
  
  it "can be instatiated" do
    expect(player).to be_instance_of(Player)
  end

  it "can't be created without a name" do
    player = Player.create(:name => "")
    expect(player.persisted?).to eq false
  end
end
