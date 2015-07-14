require 'rails_helper'

describe TeamTournament, type: :model do
  let(:team_tournament) { create :team_tournament }
  let(:team) { create :team }
  let(:tournament) { create :tournament, :teams => [team] }
  
  it "can be instatiated" do
    expect(team_tournament).to be_instance_of(TeamTournament)
  end

  it "team can be in the same tournament twice" do
    expect{
      tournament.teams << team
    }.to raise_exception(ActiveRecord::RecordInvalid)
  end

  it "teams can't share the same position in a tournament" do
    tournament.teams << create(:team)
    tournament.team_tournaments.first.update_attributes(:position => 1)
    expect{
      tournament.team_tournaments.last.update_attributes!(:position => 1)
    }.to raise_exception(ActiveRecord::RecordInvalid)
  end

end