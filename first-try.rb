# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require "pry-byebug"

class NonAmbundantSum

  def initialize
    @ceiling = 28123
  end

  def sum_total
    sum_of_all - abundant_nums_sum
  end

  def sum_of_all
    (1..@ceiling).to_a.inject(:+)
  end

  def abundant_nums_sum
    binding.pry
    abundant_nums.inject(:+)
  end

  def abundant_nums
    (1..@ceiling).select {|n| divisor_sum(n) && n < divisor_sum(n)}
  end

  def divisor_sum(n)
    (1..(n / 2)).select {|x| n % x == 0}.inject(:+)
  end

end


puts "yo, crunching numbers here"
puts NonAmbundantSum.new.sum_total