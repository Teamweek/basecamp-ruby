module Basecamp
  class Account
    include Basecamp::HashConstructed

    attr_accessor :id
    attr_accessor :name

  end
end