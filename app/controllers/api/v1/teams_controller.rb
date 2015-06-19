class Api::V1::TeamsController < ApplicationController
  include Api::V1::Concerns::Common

  def show
    respond_with @team
  end

  def index
    respond_with @teams
  end
end