module Basecamp
  module RequestHelper

    def get_objects(uri, context)
      client.get(full_path(uri)).map { |h| item = context.new(h) }
    end

    def full_path(uri)
      base_uri + uri
    end

    def base_uri
      "https://basecamp.com/#{basecamp_id}/api/v1"
    end

  end
end