# frozen_string_literal: true

require 'minitest'

# Provide a Minitest world and initialise it so that Cucumber can use it
class MinitestWorld
  extend Minitest::Assertions
  attr_accessor :assertions

  def initialize
    self.assertions = 0
  end
end

World do
  MinitestWorld.new
end
