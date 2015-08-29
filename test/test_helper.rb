ENV["RACK_ENV"] ||= "test"


#This sets up our test helper
require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/emoji'
require 'capybara'
require 'tilt/erb'

class Minitest::Test
  def teardown
    RobotInventory.delete_all
  end
end

Capybara.app = RobotWorldApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end