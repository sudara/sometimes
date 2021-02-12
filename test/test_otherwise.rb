require 'test/unit'
require 'sometimes'

class OtherwiseTest < Test::Unit::TestCase
  def test_percent_with_implicit_integer_otherwise
    i = 0
    100000.times do
      i += 50.percent_of_the_time(1)
    end
    assert_in_delta(i, 50000, 500)
  end

  def test_sometimes_with_implicit_integer_otherwise
    i = 0
    100000.times do
      i += sometimes(1)
    end
    assert_in_delta(i, 50000, 500)
  end

  def test_percent_with_explicit_integer_otherwise
    i = 0
    100000.times do
      i += 50.percent_of_the_time(1, otherwise: 1)
    end
    assert_equal i, 100000
  end

  def test_percent_with_explicit_integer_otherwise_2
    options = []
    10.times do
      options << 50.percent_of_the_time(1, otherwise: 2)
    end
    assert_equal options.uniq.sort, [1, 2]
  end

  def test_percent_with_implicit_string_otherwise
    options = []
    10.times do
      options << 50.percent_of_the_time("1")
    end
    assert_equal options.uniq.sort, ["", "1"]
  end

  def test_percent_with_explicit_string_otherwise
    options = []
    10.times do
      options << 50.percent_of_the_time("1", otherwise: "2")
    end
    assert_equal options.uniq.sort, ["1", "2"]
  end

  def test_percent_with_implicit_boolean_otherwise
    options = []
    10.times do
      options << 50.percent_of_the_time
    end

    assert_equal options.uniq - [true], [false]

    # only contains true and false values
    assert options.uniq.difference([true, false]).empty?
  end

  def test_sometimes_with_implicit_boolean
    i = 0
    100000.times do
      i += sometimes ? 1 : 0
    end
    assert_in_delta(i, 50000, 500)
  end

  class CustomObject; end

  def test_otherwise_should_return_nil
    options = []
    10.times do
      options << sometimes(CustomObject.new)
    end
    puts options.inspect
    assert options.include? nil
  end
end
