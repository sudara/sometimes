require 'test/unit'
require 'sometimes'

class PercentOfTheTimeTest < Test::Unit::TestCase
  def test_percent
    i = 0
    100000.times do
      75.percent_of_the_time do
        i += 1
      end
    end
    assert i > 73000
    assert i < 76000
  end

  def test_99
    i = 0
    100000.times do
      99.percent_of_the_time do
        i += 1
      end
    end
    assert i > 97000
  end

  def test_1
    i = 0
    100000.times do
      1.percent_of_the_time do
        i += 1
      end
    end
    assert i < 1100
  end

  def test_0
    bool = true
    100000.times do
      0.percent_of_the_time do
        bool = false
      end
    end
    assert_equal true, bool
  end
end
