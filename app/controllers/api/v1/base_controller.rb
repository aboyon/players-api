class Api::V1::BaseController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json
end