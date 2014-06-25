module Basecamper
  class Person
    include Basecamper::HashConstructed
    attr_accessor :id
    attr_accessor :identity_id
    attr_accessor :name
    attr_accessor :email_address
    attr_accessor :admin
    attr_accessor :avatar_url
    attr_accessor :created_at
    attr_accessor :updated_at
    attr_accessor :url

  end
end