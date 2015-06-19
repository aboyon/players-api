class Api::V1::PlayersController < Api::V1::BaseController
  include Api::V1::Concerns::Common

  def show
    respond_with @player
  end

  def index
    respond_with @players
  end
end