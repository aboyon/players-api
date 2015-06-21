module JsonFormat
  def set_json_format_for_request
    @request.accept = "application/json"
  end

  def json_hash
    JSON.parse(@response.body).try(:with_indifferent_access)
  end

  def json_response
    JSON.parse(@response.body)
  end
end

RSpec.configure do |config|
  config.include JsonFormat, :type => :controller
end