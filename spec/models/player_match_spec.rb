require 'rails_helper'

describe PlayerMatch, type: :model do
  let(:player_match) { create :player_match }
  
  it "can be instatiated" do
    expect(player_match).to be_instance_of(PlayerMatch)
  end

end
