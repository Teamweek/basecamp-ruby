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
      attr_accessor :url

      def bucket=(attrs)
        @project_id = attrs['id'] if attrs['type'] == 'Project'
      end

  end
end