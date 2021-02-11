require 'test/unit'
require 'sometimes'
require 'helper'

class SometimesTest < Test::Unit::TestCase
  def test_sometimes
    i = 0
    100000.times do
      sometimes do
        i += 1
      end
    end
    puts i
    assert (i < 51000) && (i > 49000)
  end

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
    assert i < 8000
  end

  def test_mostly
    i = 0
    100000.times do
      mostly do
        i += 1
      end
    end
    assert i > 90000
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

  def test_never
    bool = true
    never do
      bool = false
    end
    assert_equal true, bool
  end

  def test_always
    bool = false
    always do
      bool = true
    end
    assert_equal true, bool
  end

  def test_ish_relative_default_within_1_percent
    # default is within 1%
    assert_equal 100.ish, 99
    assert_equal 100.ish, 100
    assert_equal 100.ish, 101

    # 1% scales up
    assert_equal 100.999.ish, 100.000
    assert_equal 100.000.ish, 100.000
    assert_equal  99.900.ish, 100.000
  end

  def test_ish_absolute_delta
    assert_equal 100.ish(within: 10), 90
    assert_equal 100.ish(within: 10), 110
  end
end
