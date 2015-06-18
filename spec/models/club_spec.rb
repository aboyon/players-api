require 'rails_helper'

describe Club, type: :model do
  
  let(:club) { create :club }

  it "can be instantiated" do
    expect(club).to be_instance_of(Club)
  end

end