require 'pry'
require_relative '../lib/test_case'
require_relative '../lib/was_run'
require_relative '../lib/test_suite'

class TestCaseTest < TestCase
  def set_up
    @result = TestResult.new
  end

  def test_template_method
    test = WasRun.new('test_method')
    test.run(@result)

    assert { test.log == 'set_up test_method tear_down ' }
  end

  def test_result
    test = WasRun.new('test_method')
    test.run(@result)

    assert { @result.summary == '1 run, 0 failed' }
  end

  def test_failed_result
    test = WasRun.new('test_broken_method')
    test.run(@result)

    assert { @result.summary == '1 run, 1 failed' }
  end

  def test_failed_result_formatting
    @result.test_started
    @result.test_failed

    assert { @result.summary == '1 run, 1 failed' }
  end

  def test_suite
    suite = TestSuite.new

    suite << WasRun.new('test_method')
    suite << WasRun.new('test_broken_method')

    suite.run(@result)

    assert { @result.summary == '2 run, 1 failed' }
  end
end

suite = TestSuite.new
suite << TestCaseTest.new('test_template_method')
suite << TestCaseTest.new('test_result')
suite << TestCaseTest.new('test_failed_result_formatting')
suite << TestCaseTest.new('test_failed_result')
suite << TestCaseTest.new('test_suite')

result = TestResult.new
suite.run(result)

p result.summary
