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

  def run
    set_up
    send @name
  end

  def set_up
    @was_run = nil
    @was_set_up = true
  end
end

class WasRun < TestCase
  attr_reader :was_run, :was_set_up

  def initialize(name)
    @was_run = false
    @was_set_up = false

    super(name)
  end

  def test_method
    @was_run = true
  end

  def was_set_up
    @was_set_up = true
  end
end

class TestCaseTest < TestCase
  def set_up
    @test = WasRun.new('test_method')
  end

  def test_running
    @test.run
    assert { @test.was_run }
  end

  def test_set_up
    @test.run
    assert { @test.was_set_up }
  end
end

TestCaseTest.new('test_running').run
TestCaseTest.new('test_set_up').run
