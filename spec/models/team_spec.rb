require 'rails_helper'

describe Team, type: :model do
  
  let(:team) { create :team }

  it "can be instantiated" do
    expect(team).to be_instance_of(Team)
  end

  context "team with players" do

    let(:players_contracts) {
      [].tap { |pc|
        16.times do |t|
          pc << build(:player_season_team, {
            :player   => create(:player),
            :start_at => 1.day.ago,
            :end_at   => DateTime.now + 1.year
          })
        end
      }
    }

    it "has players" do
      team.player_season_teams = players_contracts
      expect(team.players).not_to be_empty
      expect(team.players.first).to eq(players_contracts.first.player)
    end
  end


end