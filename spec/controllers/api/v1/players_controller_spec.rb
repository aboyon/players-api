require 'rails_helper'

describe Api::V1::PlayersController do
  render_views
  before { set_json_format_for_request }

  let(:player) { create :player }
  let(:params) { { :id => player.id } }

  context "show" do
    it "should return player information" do
      get :show, params
      expect(response.status).to eq 200
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

  context "POST" do
    let(:params) {
      {
        :name         => "#{Faker::Name.first_name} #{Faker::Name.last_name}",
        :dob          => (DateTime.now - 25.years).strftime("%Y-%m-%d"),
        :nationality  => %w(ARG US BR ESP CHI).sample
      }
    }

    it "should create a user" do
      post :create, params
      expect(response.status).to eq 201
      expect(json_hash[:name]).to eq(params[:name])
      expect(json_hash[:dob]).to eq(params[:dob])
      expect(json_hash[:nationality]).to eq(params[:nationality])
    end

    it "should not allow to create a user" do
      params.delete(:name)
      post :create, params
      expect(response.status).to eq 422
      expect(json_hash.keys).to include("error")
    end
  end

  context "UPDATE" do
    let(:params) {
      {
        :name         => "#{Faker::Name.first_name} #{Faker::Name.last_name}",
        :dob          => (DateTime.now - 25.years).strftime("%Y-%m-%d"),
        :nationality  => %w(ARG US BR ESP CHI).sample
      }
    }

    it "should update a user" do
      put :update, params.merge(:id => player.id)
      expect(response.status).to eq 204
    end

    it "should not allow to update a user" do
      params[:dob] = DateTime.now
      put :update, params.merge(:id => player.id)
      expect(response.status).to eq 422
      expect(json_hash.keys).to include("error")
    end
  end

end
