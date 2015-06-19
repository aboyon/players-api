require 'rails_helper'

describe Team, type: :model do
  
  let(:team) { create :team }

  it "can be instantiated" do
    expect(team).to be_instance_of(Team)
  end

end