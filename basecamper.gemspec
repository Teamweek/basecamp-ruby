Gem::Specification.new do |s|
  s.name        = 'basecamper'
  s.version     = '0.0.1'
  s.date        = Time.now
  s.summary     = "ruby gem to communicate with new Basecamp API"
  s.authors     = ["Janika Liiv"]
  s.email       = ''
  s.files       = ["lib/basecamper.rb"]
  s.files      += Dir.glob("lib/basecamper/*.rb")
  s.homepage    = 'https://github.com/teamweek/basecamper'
  s.license     = 'MIT'

  s.required_ruby_version = '>= 1.8.7'
end
