module Api::V1::Concerns::Common
  extend ActiveSupport::Concern

  included do
    before_filter :load_subject, :only =>  [:show, :update]
    before_filter :load_subjects, :only =>  [:index]
    before_filter :create_subject, :only =>  [:create]
    before_filter :update_subject, :only => [:update]
    respond_to :json
  end

  def create_subject
    begin
      subject_variable(model.create!(create_subject_params))
    rescue ActiveRecord::RecordNotSaved, ActiveRecord::RecordInvalid => e
      render :json => {:error => e.message }, :status => :unprocessable_entity
    end
  end

  def update_subject
    begin
      @subject.assign_attributes(update_subject_params)
      @subject.save!
      subject_variable(@subject)
    rescue ActiveRecord::RecordNotSaved, ActiveRecord::RecordInvalid => e
      render :json => {:error => e.message }, :status => :unprocessable_entity
    end
  end

  def load_subject
    begin
      @subject||= subject_variable(model.find(params[:id]))
    rescue ActiveRecord::RecordNotFound
      head :status => 404
    end
  end

  def load_subjects
    instance_variable_set("@#{model}".downcase.pluralize, model.all)
  end

  protected
  def model
    self.class.name.demodulize.gsub('Controller','').singularize.constantize
  end

  def subject_variable(variable)
    instance_variable_set("@#{model}".downcase, variable)
  end

  def create_subject_params
    raise NotImplementedError, "create_subject_params method must be implemented in the controller"
  end

  def update_subject_params
    raise NotImplementedError, "update_subject_params method must be implemented in the controller"
  end

end