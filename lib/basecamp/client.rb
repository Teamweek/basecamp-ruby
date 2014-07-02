module Basecamp
  class Client
    include Basecamp::RequestHelper
    attr_accessor :client
    attr_accessor :basecamp_id
    # Initializes the Basecamp client
    # @param client: a http client
    # @param basecamp_id: Basecamp account id
    def initialize(client, basecamp_id = nil)
      @client = client
      @basecamp_id = basecamp_id
    end

    # get Basecamp accounts from launchpad.37signals.com API for the user
    # @return [Array<Basecamp::Account>] array of {Basecamp::Account} instances
    def accounts
      response = client.get('https://launchpad.37signals.com/authorization.json')
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

    # get active todolists for all projects from Basecamp API
    # @return [Array<Basecamp::Todolist>] array of {Basecamp::Todolist} instances
    def active_todolists
      get_objects("/todolists.json", Basecamp::Todolist)
    end

    # get completed todolists for all projects from Basecamp API
    # @return [Array<Basecamp::Todolist>] array of {Basecamp::Todolist} instances
    def completed_todolists
      get_objects("/todolists/completed.json", Basecamp::Todolist)
    end

    # get assigned todos for person from Basecamp API
    # @return [Array<Basecamp::Todo>] array of {Basecamp::Todo} instances
    def assigned_todos(person_id)
      todolists = get_objects("/people/#{person_id}/assigned_todos.json", Basecamp::Todolist)
      todolists.collect{ |list| list.assigned_todos }.flatten
    end
  end
end
