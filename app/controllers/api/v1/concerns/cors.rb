module Api::V1::Concerns::Cors
  extend ActiveSupport::Concern

  CORS_DOMAINS = ["http://localhost:8000"]

  included do
    before_filter :cors_preflight_check
    before_filter :cors_set_access_control_headers
  end

  def cors_preflight_check
    if request.method == :options.to_s.upcase
      cors_set_access_control_headers
      render :text => '', :content_type => 'text/plain'
    end
  end

  def cors_set_access_control_headers
    if CORS_DOMAINS.include? request.headers["HTTP_ORIGIN"]
      headers['Access-Control-Allow-Origin'] = "*"
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, Cache-Control, X-Prototype-Version, Content-Type, Authorization'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Max-Age'] = "1728000"
    end
  end
end