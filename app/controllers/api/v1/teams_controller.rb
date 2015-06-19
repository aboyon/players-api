class Api::V1::TeamsController < Api::V1::BaseController
  include Api::V1::Concerns::Common

  def show
    respond_with @team
  end

  def index
    respond_with @teams
  end
end