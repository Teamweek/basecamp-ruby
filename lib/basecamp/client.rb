module Basecamp
  class Client
    attr_accessor :client
    # Initializes the Basecamp client
    # @param client: a http_client
    # @param basecamp_id: Basecamp account id
    def initialize(client, basecamp_id = nil)
      @client = client
      @client.base_uri(base_uri(basecamp_id))
    end

    # get Basecamp accounts from launchpad.37signals.com API for the user
    # @return [Array<Basecamp::Account>] array of {Basecamp::Account} instances
    def accounts
      response = client.get '/authorization.json'
      response["accounts"].map { |h|
        if h["product"] == "bcx"
          Basecamp::Account.new(h)
        end
      }.compact
    end

    # get projects from Basecamp API
    # @return [Array<Basecamp::Project>] array of {Basecamp::Project} instances
    def projects
      get_objects("/projects.json", Basecamp::Project)
    end

    # get users from Basecamp API
    # @return [Array<Basecamp::Person>] array of {Basecamp::Person} instances
    def people
      get_objects("/people.json", Basecamp::Person)
    end

    # get todolists from Basecamp API
    # @return [Array<Basecamp::Todolist>] array of {Basecamp::Todolist} instances
    def todolists
      get_objects("/todolists.json", Basecamp::Todolist)
    end

    private

    def get_objects(uri, context)
      response = client.get(uri)
      response.map { |h| context.new(h) }
    end

    def base_uri(basecamp_id = nil)
      if basecamp_id
        "https://basecamp.com/#{basecamp_id}/api/v1"
      else
        "https://launchpad.37signals.com"
      end
    end
  end
end
