module Basecamp
  class Todo
    include Basecamp::HashConstructed

    attr_accessor :id
    attr_accessor :project_id
    attr_accessor :assignee_id
    attr_accessor :content
    attr_accessor :completed
    attr_accessor :comments_count
    attr_accessor :url
    attr_accessor :due_at
    attr_accessor :position

    def assignee(attrs)
      @assignee_id = attrs['id'] if attrs['type'] == 'Person'
    end
  end
end