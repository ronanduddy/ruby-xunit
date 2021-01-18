require 'pry'
require_relative '../lib/test_case'
require_relative '../lib/was_run'

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
