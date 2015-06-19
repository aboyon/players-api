require 'rails_helper'

describe Api::V1::PlayersController, type: :controller do
  let(:player) { create :player }

  it "should return player information" do
    get :show, { :id => player.id }
  end
end
