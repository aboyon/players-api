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

  it "can't be created if younger 18 years" do
    player = Player.create(:name => "Hernan and David", :dob => 10.years.ago)
    expect(player.persisted?).to eq false
    expect(player.errors.keys).to include(:too_younger)
  end
end
