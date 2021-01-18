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
