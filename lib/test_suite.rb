require_relative 'test_result'

class TestSuite
  def initialize
    @tests = []
  end

  def <<(test)
    @tests << test
  end

  def run(result)
    @tests.each { |test| test.run(result) }
  end
end
