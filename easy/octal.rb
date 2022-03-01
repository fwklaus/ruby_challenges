# frozen_string_literal: true

# Problem: Implement Octal to decimal conversion.
# input: octal input string
# putput: decimal output
#
# Octal 0 is invalid input
#  Don't use any built-in or library methods to perform the conversions
#    don't use to_s
#
# Decimal is a base-10 system
#     - linear combination of powers of 10
# Octal numbers use a base-8 system
#     - linear combination of powers of 18
#
#
# Classes/Methods:
# Octal class
#   constructor method
#   to_decimal instance method
#
# Method: Constructor
# input: string
# output: integer
#
# rules:
#   - takes a string
#   - return integer
#       - decimal output - base-8
#       - return 0 if invalid input
#            - if input contains any characters that are not 0-7
#
# - set octal number string to ivar @number
#
#
#
# Method: to_decimal
# input: none
# output: integer
#
# rules:
#   - if ivar @num contains any characters that are not 0-7
#         - return 0
#
# data/alg:
# - validtate ivar @num
# - create a variable to store the base-8 decimal value
# - reverse the string
#    - starting at first char
#    - convert char to integer
#        - multiply the character by 8 to the power of index
#          - add the result to the base-8 variable
#
#

# Octal class
class Octal
  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if invalid_num_string?

    base8 = 0

    @num.reverse.chars.each_with_index do |char, idx|
      base8 += char.to_i * (8**idx)
    end
    base8
  end

  def invalid_num_string?
    @num.match?(/[^0-7]/)
  end
end
