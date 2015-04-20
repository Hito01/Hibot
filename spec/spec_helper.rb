require 'simplecov'
SimpleCov.start do
  add_filter "/spec/"
  add_filter "/vendor/"
end

require "bundler"
Bundler.setup

require 'fileutils'
require "hibot"

Bundler.require(:test)