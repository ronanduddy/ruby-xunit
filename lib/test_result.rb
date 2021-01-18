class TestResult
  def initialize
    @run_count = 0
    @error_count = 0
  end

  def test_started
    @run_count += 1
  end

  def test_failed
    @error_count += 1
  end

  def summary
    variables = { run_count: @run_count, error_count: @error_count }
    template = '%{run_count} run, %{error_count} failed'

    sprintf(template, variables)
  end
end
