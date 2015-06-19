class Api::V1::PlayersController < ApplicationController
  include Api::V1::Common

  def show
    respond_with @player
  end
end