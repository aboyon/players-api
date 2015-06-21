require 'rails_helper'

describe Api::V1::TeamsController do
  before { set_json_format_for_request }

  let(:team) { create :team }
  let(:params) { { :id => team.id } }

  context "show" do
    it "should return team information" do
      get :show, params
      expect(json_hash[:name]).to eq(team.name)
    end

    it "should return 404 since team does not exists" do
      get :show, params.merge(:id => 9999999)
      expect(response.status).to eq(404)
    end
  end

  context "index" do
    it "should return a collection of teams" do
      5.times { create :team }
      get :index
      expect(json_response.any?).to eq true
      expect(json_response.size).to eq 5
    end
  end

  context "POST" do
    let(:params) { {:name => "#{Faker::Name.first_name} FC"} }

    it "should create a team" do
      post :create, params
      expect(response.status).to eq 201
      expect(json_hash[:name]).to eq(params[:name])
    end

    it "should not allow to create a user" do
      params.delete(:name)
      post :create, params
      expect(response.status).to eq 422
      expect(json_hash.keys).to include("error")
    end
  end

end
