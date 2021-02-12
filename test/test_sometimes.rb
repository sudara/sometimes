require 'test/unit'
require 'sometimes'

class SometimesTest < Test::Unit::TestCase
  def test_sometimes_with_block
    i = 0
    100000.times do
      sometimes do
        i += 1
      end
    end
    assert (i < 51000) && (i > 49000)
  end

  def test_ranges
    i = 0
    (25..50).times { i += 1 }
    assert i > 24
    assert i < 51
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
end
