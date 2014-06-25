Gem::Specification.new do |s|
  s.name        = 'basecamp-ruby'
  s.version     = '0.0.1'
  s.date        = Time.now
  s.summary     = "ruby gem to communicate with new Basecamp API"
  s.authors     = ["Janika Liiv"]
  s.email       = ''
  s.files       = ["lib/basecamp-ruby.rb"]
  s.files      += Dir.glob("lib/basecamp/*.rb")
  s.homepage    = 'https://github.com/teamweek/basecamp-ruby'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 1.8.7'
end
