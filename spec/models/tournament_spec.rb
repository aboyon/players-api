require 'rails_helper'

describe Tournament, type: :model do
  let(:tournament) { create :tournament }
  
  it "can be instatiated" do
    expect(tournament).to be_instance_of(Tournament)
  end

  it "can't be created without a name" do
    tournament = Tournament.create(:name => "")
    expect(tournament.persisted?).to eq false
  end
end
