module Basecamper
  class Client
    attr_accessor :client
    # Initializes the Basecamper client
    #
    # @param client: a http_client
    # @param basecamp_id: Basecamp account id
    def initialize(client, basecamp_id)
      @client = client
      @client.base_uri "https://basecamp.com/#{basecamp_id}/api/v1"
    end

    # get projects from Basecamp API
    #
    # @return [Array<Basecamper::Project>] array of {Basecamper::Project} instances
    def projects
      response = client.get '/projects.json'
      request.parsed_response.map { |h| Basecamper::Project.new(h) }
    end

    # get users from Basecamp API
    #
    # @return [Array<Basecamper::Person>] array of {Basecamper::Person} instances
    def people
      response = self.class.get "/people.json"
      request.parsed_response.map { |h| Basecamper::Person.new(h) }
    end
  end
end
