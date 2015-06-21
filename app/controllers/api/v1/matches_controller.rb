class Api::V1::MatchesController < Api::V1::BaseController
  include Api::V1::Concerns::Common

  def show
    respond_with @match
  end

  def index
    respond_with @matches
  end

  def create
    respond_with @match, :status => :created
  end

  def update
    respond_with @match, :status => 204
  end

  protected
  def create_subject_params
    params.permit(
      :local_team_id,
      :visitor_team_id,
      :date
    )
  end

end