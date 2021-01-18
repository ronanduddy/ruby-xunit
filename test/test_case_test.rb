require 'pry'
require_relative '../lib/test_case'
require_relative '../lib/was_run'

class TestCaseTest < TestCase
  def set_up
    @test = WasRun.new('test_method')
  end

  def test_template_method
    @test.run
    assert { @test.log == 'set_up test_method tear_down ' }
  end

  def test_result
    result = @test.run
    assert { result.summary == '1 run, 0 failed' }
  end

  def test_failed_result
    @test = WasRun.new('test_broken_method')
    result = @test.run
    assert { result.summary == '1 run, 1 failed' }
  end

  def test_failed_result_formatting
    result = TestResult.new
    result.test_started
    result.test_failed
    assert { result.summary == '1 run, 1 failed' }
  end
end

p TestCaseTest.new('test_template_method').run.summary
p TestCaseTest.new('test_result').run.summary
p TestCaseTest.new('test_failed_result_formatting').run.summary
p TestCaseTest.new('test_failed_result').run.summary
