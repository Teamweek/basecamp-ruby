module Basecamp
  class Client
    attr_accessor :client
    # Initializes the Basecamp client
    #
    # @param client: a http_client
    # @param basecamp_id: Basecamp account id
    def initialize(client, basecamp_id)
      @client = client
      @client.base_uri "https://basecamp.com/#{basecamp_id}/api/v1"
    end

    # get projects from Basecamp API
    #
    # @return [Array<Basecamp::Project>] array of {Basecamp::Project} instances
    def projects
      request = client.get '/projects.json'
      request.parsed_response.map { |h| Basecamp::Project.new(h) }
    end

    # get users from Basecamp API
    #
    # @return [Array<Basecamp::Person>] array of {Basecamp::Person} instances
    def people
      request = client.get "/people.json"
      request.parsed_response.map { |h| Basecamp::Person.new(h) }
    end
  end
end
