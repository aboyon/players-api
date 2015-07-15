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
    player = Player.create(:name => "Young player", :dob => 10.years.ago)
    expect(player.persisted?).to eq false
    expect(player.errors.keys).to include(:too_younger)
  end

  context "with teams" do
    it "sign contract with a club" do
      contract_start_at = DateTime.now
      team = create :team
      player.player_season_teams << create(:player_season_team, {
        :team     => team,
        :start_at => contract_start_at,
        :end_at => contract_start_at + 2.years
      })
      expect(player.current_team).to eq(team)
    end

    it "sign contract with a club cancells any other previous one" do
      contract_start_at = DateTime.now
      team = create :team
      player.player_season_teams << build(:player_season_team, {
        :team     => team,
        :start_at => contract_start_at,
        :end_at => contract_start_at + 2.years
      })
      expect(player.current_team).to eq(team)

      new_contract_start_at = DateTime.now
      team2 = create :team
      player.player_season_teams << build(:player_season_team, {
        :team     => team2,
        :start_at => new_contract_start_at,
        :end_at   => new_contract_start_at + 2.years
      })
      player.player_season_teams.reload
      expect(player.current_team).to eq(team2)
      expect(player.previous_teams).to include(team)
    end
  end

end
