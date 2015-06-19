module Api::V1::Concerns::Common
  extend ActiveSupport::Concern

  included do
    before_filter :load_subject, :only =>  [:show, :update]
    respond_to :json
  end

  def load_subject
    begin
      subject = model.find(params[:id])
      instance_variable_set("@#{model}".downcase, subject)
    rescue ActiveRecord::RecordNotFound
      head :status => 404
    end
  end

  protected
  def model
    self.class.name.demodulize.gsub('Controller','').singularize.constantize
  end
end