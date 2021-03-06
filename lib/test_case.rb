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

  def run(result)
    result.test_started
    set_up

    begin
      send @name
    rescue
      result.test_failed
    end

  ensure
    tear_down
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
