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
    # noop
  end

  def run
    set_up
    send @name
    tear_down
  end

  def tear_down
    # noop
  end
end
