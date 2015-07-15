require 'rails_helper'

describe PlayerSeasonTeam, type: :model do
  let(:player_season_team) { create :player_season_team }
  
  it "can be instatiated" do
    expect(player_season_team).to be_instance_of(PlayerSeasonTeam)
  end

  it "player is not longer participating in a team" do
    player_season_team = create :player_season_team, :active => false
    expect(player_season_team).not_to be_active
  end

  it "player contract is ended" do
    player_season_team = create :player_season_team, :start_at => 1.year.ago, :end_at => 1.month.ago
    expect(player_season_team).to be_ended
  end

  it "invalid contract dates" do
    expect{
      create :player_season_team, :start_at => 1.day.ago, :end_at => 1.month.ago
    }.to raise_exception(ActiveRecord::RecordInvalid)
  end

end
