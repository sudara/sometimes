require "sometimes/version"

# -*- encoding : utf-8 -*-
# OH SO FUN HELPERS!

# RANDOMLY EXECUTES A BLOCK X percent OF THE TIME
#
# TEST WITH
#
# i = 0
# 100000.times do
#   75.percent_of_the_time do
#     i += 1
#   end
# end
# i
#
#
# 40.percent_of_the_time do
class Integer
  def percent_of_the_time(&block)
    return if self == 0

    if self < 0 || self > 100
      raise(ArgumentError, 'Integer should be between 0 and 100 to be used with the percent_of_the_time method')
    else
      yield block if Kernel.rand(1..100) <= self
    end
  end
end

# (3..6).times do
class Range
  def times(&block)
    Random.rand(self).times(&block)
  end
end

# half_the_time do
# sometimes do
class Object
  def half_the_time(&block)
    50.percent_of_the_time(&block)
  end
  alias sometimes half_the_time

  def rarely(&block)
    5.percent_of_the_time(&block)
  end

  def mostly(&block)
    95.percent_of_the_time(&block)
  end

  def never(&block); end

  def always
    yield
  end
end


# Inspired by
# https://spin.atomicobject.com/2012/11/13/convenient-trick-for-tolerance-based-test-assertions-using-ish/
# Except the default is to have a implicit 1% relative tolerance
# Unless an absolute delta is passed in

class Numeric
  def ish(**kwargs)
    @approximateNumeric =
    Sometimes::ApproximateNumeric.new self, kwargs
  end
end

module Sometimes
  class ApproximateNumeric < Numeric
    def initialize(numeric, within: false, within_relative: 0.01)
      @numeric = numeric
      @delta = within || numeric * within_relative
    end

    def ==(other)
      (other - @numeric).abs <= @delta
    end

    def to_s
      "within #{@delta} of #{@numeric}"
    end
  end
end
