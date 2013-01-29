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
class Fixnum
  def percent_of_the_time(&block)
    raise(ArgumentError, 'Fixnum should be between 1 and 100 to be used with the times method') unless self > 0 && self <= 100
    yield if (Kernel.rand(99)+1) <= self
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
    50.percent_of_the_time {yield}
  end
  alias :sometimes :half_the_time

  def rarely(&block)
    5.percent_of_the_time {yield}
  end

  def mostly(&block)
    95.percent_of_the_time {yield}
  end
end
