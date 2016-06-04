ENV['RACK_ENV'] = 'test'

require 'bundler'
Bundler.require :default, :test

require 'minitest/autorun'
require 'minitest/rg'
require 'mocha/mini_test'

# Load the sinatra application
require_relative '../service'

# Load the unit helpers
require_relative 'support/unit_helpers.rb'

class UnitTest < MiniTest::Spec
  include UnitHelpers

  register_spec_type(self) do |desc, *addl|
    true if desc.is_a?(Class)
    addl.include? :unit
  end
end