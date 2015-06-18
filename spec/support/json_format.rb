module JsonFormat
  def set_json_format_for_request
    @request.accept = "application/json"
  end
end

RSpec.configure do |config|
  config.include JsonFormat, :type => :controller
end