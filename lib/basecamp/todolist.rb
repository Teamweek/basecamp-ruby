module Basecamp
  class Todolist
    include Basecamp::HashConstructed

    attr_accessor :id
    attr_accessor :name
    attr_accessor :project_id
    attr_accessor :description
    attr_accessor :completed
    attr_accessor :remaining_count
    attr_accessor :completed_count
    attr_accessor :created_at
    attr_accessor :updated_at
    attr_accessor :url
    attr_accessor :todos

    def bucket=(attrs)
      @project_id = attrs['id'] if attrs['type'] == 'Project'
    end

    def assigned_todos
      raw_response['assigned_todos'].map do |h|
        Basecamp::Todo.new(h.merge('project_id' => project_id))
      end
    end

  end
end