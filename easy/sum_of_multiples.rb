require "pry"
=begin
- Given a natural number, a set of one or more other numbers
- Write a Program that finds the sum of all the multiples of the numbers in the set that are less than the first number

- if the set of numbers is not given, use a default set of 3 and 5

example:

sum of all multiples of the numbers in the set less than the first number

number: 20
set: 3, 5

3, 5, 6, 9, 10, 12, 15, 18

sum = 78 


-Create a class SumOfMultiples
- Can take a set of numbers at instantiation
    - optional number of integers
- Create a class method self.to which takes a number
  and returns the sum of the multiples

Method: self.to
- takes an integer
- uses the default set
- iterate over the set
- create a variable to hold the sum of the current number
   - create a loop for each number
   - add the number to an array
      save to sum - the current number added to itself
- break out of the loop when the sum is greater than or equal to the initial value passsed to the method 
      

CAN WE HAVE DUPLICATES?


=end

class SumOfMultiples
  def initialize(*nums)
    @set = nums
  end

  def set
    @set.empty? ? [3, 5] : @set
  end

  def self.to(num)
    get_multiples_sum(num)
  end
  
  def to(num)
    get_multiples_sum(num)
  end
  
  private

    def get_multiples_sum(num)
      multiples= []

      @set.each do |n|
        sum = n
        while sum < num
          multiples << sum
          sum += n
        end
      end
      multiples.uniq.sum
    end

  class << self
    def get_multiples_sum(num)
      set = SumOfMultiples.new.set
      multiples= []

      set.each do |n|
        sum = n
        while sum < num
          multiples << sum
          sum += n
        end
      end
      multiples.uniq.sum
    end
  end
end


# mult1 = SumOfMultiples.new(1, 2, 4)
# p mult1.set

# mult2 = SumOfMultiples.new
# p mult2.set

# p SumOfMultiples.to(10)
# 23

#3, 6, 9, 5


# p SumOfMultiples.new(7, 13, 17).to(20)

