module Basecamper
  class Project
    include Basecamper::HashConstructed

    attr_accessor :id
    attr_accessor :name

  end
end