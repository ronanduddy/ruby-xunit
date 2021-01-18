class TestCase
  AssertionError = Class.new(RuntimeError)

  def initialize(name)
    @name = name
  end

  def assert(&block)
    raise AssertionError, 'Must supply block' unless block_given?
    result = yield
    raise AssertionError, "#{result}" unless result
  end

  def run
    send @name
  end
end

class WasRun < TestCase
  attr_reader :was_run

  def initialize(name)
    @was_run = false
    super(name)
  end

  def test_method
    @was_run = true
  end
end

class TestCaseTest < TestCase
  def test_running
    test = WasRun.new('test_method')
    assert { !test.was_run }
    test.run
    assert { test.was_run }
  end
end

TestCaseTest.new('test_running').run
