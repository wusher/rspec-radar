Gem::Specification.new do |s|
  s.name     = "rspec-radar"
  s.version  = "0.1.0"
  s.summary  = "Monkey patch rspec-mocks to check for method existence"
  s.license  = "MIT"
  s.authors  = [ "wusher" ]
  s.email    = 'will@wusher.com'
  s.homepage = 'http://github.com/wusher/rspec-radar'

  s.platform     = Gem::Platform::RUBY
  s.has_rdoc     = false 
  s.require_path = 'lib'
  s.files        = `git ls-files -- lib/*`.split("\n")
  s.files       += %w( Gemfile Readme.md history.md License Rakefile rspec-radar.gemspec )

  s.add_dependency 'rspec', '~> 2.11'
  s.add_development_dependency 'rake'
end
