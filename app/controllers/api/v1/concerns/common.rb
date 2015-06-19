module Api::V1::Common
  extend ActiveSupport::Concern

  included do
    before_filter :load_subject, :only =>  [:show, :update]
    respond_to :json
  end

  def load_subject
    instance_variable_set("@#{model}", model.find(params[:id]))
  end

  protected
  def model
    self.demodulize.gsub('Controller','').singularize.constantize
  end
end