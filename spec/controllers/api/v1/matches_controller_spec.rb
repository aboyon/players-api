require 'rails_helper'

describe Api::V1::MatchesController do
  render_views
  before { set_json_format_for_request }

  let(:local)   { create :team }
  let(:visitor) { create :team }
  let(:match)   { create :match, :local_team => local, :visitor_team => visitor }
  let(:params) { { :id => match.id } }

  context "show" do
    it "should return match information" do
      get :show, params
      expect(json_hash[:local][:name]).to eq(match.local_team.name)
      expect(json_hash[:visitor][:name]).to eq(match.visitor_team.name)
    end

    it "should return 404 since team does not exists" do
      get :show, params.merge(:id => 9999999)
      expect(response.status).to eq(404)
    end
  end

  context "index" do
    it "should return a collection of matches" do
      5.times { create :match }
      get :index
      expect(json_response.any?).to eq true
      expect(json_response.size).to eq 5
    end
  end

  context "POST" do
    let(:local)   { create :team, :name => "Local team" }
    let(:visitor) { create :team, :name => "Visitor team" }
    let(:params) { {:local_team_id => local.id, :visitor_team_id => visitor.id} }

    it "should create a match" do
      post :create, params.merge(:date => DateTime.now + 1.week)
      expect(response.status).to eq 201
      expect(json_hash[:name]).to eq(params[:name])
    end

    it "should not allow to create a match since teams are empty" do
      params.delete(:local_team_id)
      post :create, params
      expect(response.status).to eq 422
      expect(json_hash.keys).to include("error")
    end

    it "should not allow to create a match since teams are equals" do
      params[:visitor_team_id] = params[:local_team_id]
      post :create, params
      expect(response.status).to eq 422
      expect(json_hash.keys).to include("error")
      expect(json_hash[:error]).to include("Visitor team can't be equal than local team.")
    end

    it "should not allow to create a match without date" do
      post :create, params
      expect(response.status).to eq 422
      expect(json_hash.keys).to include("error")
      expect(json_hash[:error]).to include("Date can't be blank")
    end
  end
end
