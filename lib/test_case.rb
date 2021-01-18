require_relative 'test_result'

class TestCase
  AssertionError = Class.new(RuntimeError)

  def initialize(name)
    @name = name
  end

  def assert(&block)
    raise AssertionError, 'Must supply block' unless block_given?
    error(block) unless yield
  end

  def set_up
    # noop
  end

  def run
    result = TestResult.new
    result.test_started

    set_up
    send @name
    tear_down

    result
  end

  def tear_down
    # noop
  end

  private

  def error(block)
    location = block.source_location
    file = location.first
    line = location.last
    assertion = block.source.strip

    message = "#{assertion} failed for #{file}:#{line}"
    raise AssertionError, message
  end
end
