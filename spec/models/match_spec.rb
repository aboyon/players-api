require 'rails_helper'

describe Match, type: :model do
  let(:match) { create :match }
  
  it "can be instatiated" do
    expect(match).to be_instance_of(Match)
  end

  it "can't be created if both teams are the same" do
    team = create :team
    match = Match.create(:local_team => team, :visitor_team => team)
    expect(match.persisted?).to eq false
    expect(match.errors.keys).to include(:visitor_team)
  end

  it "can't be created if no date is present" do
    match = Match.create({
      :local_team => create(:team),
      :visitor_team => create(:team)
    })
    expect(match.persisted?).to eq false
    expect(match.errors.keys).to include(:date)
  end
end
