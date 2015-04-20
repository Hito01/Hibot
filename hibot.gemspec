# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = 'hibot'
  s.version     = '0.0.1'
  s.date        = '2015-04-16'
  s.summary     = "IRC bot supporting multiple services."
  s.description = "IRC bot supporting multiple services like spotify, giphy and so on."
  s.authors     = ["Nicolas Collard"]
  s.email       = 'niko@hito.be'
  s.files       = ["lib/hibot.rb"]
  s.homepage    = 'https://github.com/Hito01/Hibot'
  s.license     = 'MIT'

  s.add_dependency "cinch", "~> 2.2"
  s.add_dependency "httparty", "~> 0.13"
  s.add_dependency "rainbow", "~> 2.0"

  s.add_development_dependency "bundler", "~> 1.9"
  s.add_development_dependency "rake", "~> 10.4"

  s.files      = `git ls-files`.split($\)
  s.test_files = s.files.grep(/^spec/)

  s.executables << "hibot"
end
