require 'basecamp-ruby'
require 'httparty'

class ExampleClient
  USER_AGENT = "basecamp-ruby example (https://github.com/Teamweek/basecamp-ruby)"

  def initialize(username, password)
    @auth = { username: username, password: password }
  end

  def get(path)
    handle_response(HTTParty.get(path, options))
  end

  def options
    {basic_auth: @auth, headers: {"User-Agent"  => USER_AGENT}}
  end

  def handle_response(request)
    if request.response.kind_of? Net::HTTPSuccess
      request.parsed_response
    else
      #place for more sophisticated error handling
      raise "Something went wrong"
    end
  end
end

http_client = ExampleClient.new('<username>', '<password>')
basecamp_id = "<basecamp_id>"
basecamp_client = Basecamp::Client.new(http_client, basecamp_id)
people = basecamp_client.people