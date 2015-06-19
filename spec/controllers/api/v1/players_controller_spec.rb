require 'rails_helper'

describe Api::V1::PlayersController do
  before { set_json_format_for_request }

  let(:player) { create :player }
  let(:params) { { :id => player.id } }

  context "show" do
    it "should return player information" do
      get :show, params
      expect(json_hash[:name]).to eq(player.name)
      expect(json_hash[:dob]).to eq(player.dob.strftime("%Y-%m-%d"))
      expect(json_hash[:nationality]).to eq(player.nationality)
    end

    it "should return 404 since player does not exists" do
      get :show, params.merge(:id => 9999999)
      expect(response.status).to eq(404)
    end
  end

  context "index" do
    it "should return a collection of players" do
      5.times { create :player }
      get :index
      expect(json_response.any?).to eq true
      expect(json_response.size).to eq 5
    end
  end

end
