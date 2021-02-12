require "sometimes/version"

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
#   some_task
# end
#
# 40.percent_of_the_time(true, otherwise: false)
#
# 40.percent_of_the_time ? something : something_else
class Integer
  def percent_of_the_time(*arg, otherwise: nil)
    return if self == 0

    raise(ArgumentError, 'Integer should be between 0 and 100 to be used
      with the percent_of_the_time method') if self < 0 || self > 100

    if Kernel.rand(1..100) <= self
      if block_given?
        yield
      elsif arg.empty?
        true
      else
        arg.first
      end
    else
      format_otherwise(arg, otherwise)
    end
  end

  protected

  def format_otherwise(arg, otherwise)
    return false if arg.empty?

    if arg.first.is_a? Integer
      otherwise.to_i
    elsif arg.first.is_a? Float
      otherwise.to_f
    elsif arg.first.respond_to? :to_str
      otherwise.to_s
    else
      otherwise
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
  def half_the_time(...)
    50.percent_of_the_time(...)
  end
  alias sometimes half_the_time

  def rarely(...)
    5.percent_of_the_time(...)
  end

  def mostly(...)
    95.percent_of_the_time(...)
  end

  def never(...); end

  def always
    yield
  end
end
