require 'pry'

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

  def set_up
    #  noop
  end

  def run
    set_up
    send @name
  end
end

class WasRun < TestCase
  attr_reader :was_run, :was_set_up, :log

  def initialize(name)
    @was_run = false
    @was_set_up = false

    super(name)
  end

  def set_up
    @was_run = nil
    @was_set_up = true
    @log = "Setup "
  end

  def was_set_up
    @was_set_up = true
  end

  def test_method
    @was_run = true
    @log << 'test_method '
  end
end

class TestCaseTest < TestCase
  def set_up
    # noop
  end

  def test_template_method
    @test = WasRun.new('test_method')
    @test.run
    assert { @test.log == 'Setup test_method ' }
  end
end

TestCaseTest.new('test_template_method').run
