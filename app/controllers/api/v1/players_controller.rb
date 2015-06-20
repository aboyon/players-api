class Api::V1::PlayersController < Api::V1::BaseController
  include Api::V1::Concerns::Common

  respond_to :json

  def show
    respond_with @player
  end

  def index
    respond_with @players
  end

  def create
    respond_with @player, :status => :created
  end

  def update
    respond_with @player, :status => 204
  end

  protected
  def create_subject_params
    params.permit(
      :name,
      :dob,
      :nationality
    )
  end

  def update_subject_params
    params.permit(
      :name,
      :dob,
      :nationality
    )
  end

end