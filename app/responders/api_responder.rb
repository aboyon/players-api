class ApiResponder < ActionController::Responder
  def to_format
    @response = controller.response
  
    if format == :xml
      json_response = JSON.parse(controller.render_to_string( :formats => [:json] )) rescue nil
      render xml: json_response.to_xml(:root => 'response')
    else
      default_render
    end
    
    rescue ActionView::MissingTemplate => e
      Rails.logger.debug "ERROR => ActionView::MissingTemplate: #{e}"
      begin
        api_behavior(e)
      rescue Exception=>e
        Rails.logger.debug "inside Exception: #{e}"
        render json: @resource.to_json
      end

  end
end