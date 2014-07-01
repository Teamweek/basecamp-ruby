module Basecamp
  module HashConstructed
    attr_accessor :raw_data
    # @param [Hash] h hash containing key-value pairs to map to object instance variables
    def initialize(h)
      @raw_data = h
      h.each { |k,v| send("#{k}=",v) if respond_to?("#{k}=") }
    end
  end
end