class TestResult
  def initialize
    @run_count = 0
  end

  def test_started
    @run_count += 1
  end

  def summary
    variables = { run_count: @run_count }
    template = '%{run_count} run, 0 failed'

    sprintf(template, variables)
  end
end
