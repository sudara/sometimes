require 'test/unit'
require 'sometimes'

class SometimesTest < Test::Unit::TestCase
  def test_ranges
    i = 0
    (25..50).times { i += 1 }
    assert i > 24 
    assert i < 51
  end

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

  def test_rarely
    i = 0
    100000.times do
      rarely do
        i += 1
      end
    end
    assert i < 10000
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
end