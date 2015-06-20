class Api::V1::BaseController < ActionController::API
  include ActionController::RequestForgeryProtection
  include ActionController::MimeResponds
  include ActionController::ImplicitRender
  include ActionController::StrongParameters      
  respond_to :json
  self.responder = ApiResponder
end