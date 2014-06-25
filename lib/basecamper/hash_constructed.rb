module Basecamper
  module HashConstructed
    # @param [Hash] h hash containing key-value pairs to map to object instance variables
    def initialize(h)
      h.each { |k,v| send("#{k}=",v) if respond_to?("#{k}=") }
    end
  end
end