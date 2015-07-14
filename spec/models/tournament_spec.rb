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

  it "is already ended" do
    tournament.year = 1999
    expect(tournament.ended?).to eq true
  end

  it "has not a champion yet" do
    tournament.teams << create(:team)
    tournament.teams << create(:team)
    expect(tournament.champion).to be_nil
  end

  it "has a champion" do
    tournament.teams << create(:team)
    tournament.teams << create(:team)
    tournament.team_tournaments.first.update_attributes(:position => 1)
    champ = tournament.team_tournaments.first.team
    expect(tournament.champion).to eq(champ)
    binding.pry
    expect(champ.honours).to include(tournament)
  end
end
