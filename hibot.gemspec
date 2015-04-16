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
  s.homepage    = 'http://rubygems.org/gems/hibot'
  s.license     = 'MIT'

  s.add_dependency "cinch", "~> 2.2"

  s.add_development_dependency "bundler", "~> 1.9"

  s.files      = `git ls-files`.split($\)

  s.executables << "hibot"
end