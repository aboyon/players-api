class Api::V1::BaseController < ActionController::API
  include ActionController::RequestForgeryProtection
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::StrongParameters
  include Api::V1::Concerns::Cors

  respond_to :json
  self.responder = ApiResponder
end