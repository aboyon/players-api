class Api::V1::PlayersController < ApplicationController
  include Api::V1::Concerns::Common

  def show
    respond_with @player
  end

  def index
    respond_with Player.all
  end
end