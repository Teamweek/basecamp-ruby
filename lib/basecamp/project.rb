module Basecamp
  class Project
    include Basecamp::HashConstructed

    attr_accessor :id
    attr_accessor :name

  end
end