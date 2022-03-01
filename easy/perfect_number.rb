# Sum of positive divisors is known as the aliquot sum

# Perfect numbers have an Aliquot sum that is equal to the original number.
# Abundant numbers have an Aliquot sum that is greater than the original number.
# Deficient numbers have an Aliquot sum that is less than the original number.

# examples:

# 6
# 1 + 2 + 3 = 6  
# Perfect Number

# 24 
# 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36
# Abundant Number

# 7
# 1  =  1
# Prime
# Prime numbers are always deficient since their only divisor is 1

=begin

Write a program that can tell whether a number is perfect abundant, or decicient

- take a number as an argument at instantiation
- return a string describing the number
- find the divisors of the number


Class Method: self.classify

input: integer
output: string
mutating?:

rules:
   -explicit:
      - take an integer as an argument
      - return a string
          - describes the number
    
   -implicit:
      - find the positive divisors for the number
      - prime numbers are always deficient
          - a prime number is only divisible by 1
      - raise an error if an invalid number (negative) is passed to the method 
     
unclear parts of problem?:

examples/test_cases:
# 6
# 1 + 2 + 3 = 6  
# Perfect Number

# 24 
# 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36
# Abundant Number

# 7
# 1  =  1
# Prime
# Prime numbers are always deficient since their only divisor is 1

data/alg:

take a number as an argumnet
- determine if the number is prime
    - if so, return 'deficient'

Method: is_prime?

- take a number as an argumnet
- create an empty array to store the positive divisors
- create a range from 1 to one less than the number  
   - check if the argument is evenly divisible by each number
       in the range
    - if so, add the number to an array
- return the sum of the array


=end


class PerfectNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def self.classify(number)
    raise StandardError if number < 1
    num = PerfectNumber.new(number)
    
    total = num.get_divisor_sum

    case
    when total > number  then 'abundant'
    when total == number then 'perfect'
    else 
      'deficient'
    end
  end

  def get_divisor_sum
    divisors = []

    (1...number).each do |num|
      divisors << num if number % num == 0
    end

    divisors.sum
  end
end


# puts PerfectNumber.classify(10)


