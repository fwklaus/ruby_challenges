# frozen_string_literal: true

# Determine whether a triangle is equilateral, isoscles, or scalene
#
# equilateral - all sides are the same length
# isoscles - esactly two sides are the same length
# scalene - all sides of different lengths
#
# All sides must be of length > 0 for it to be a valid triangle
#     - the sum of the lengths of any two sides must be greater than the length of the third side
#
#
# classes/methods:
# class Triangle
#   constuructor
#   instance method kind
#
#
# Method: Constructor
# input: three integers
#
# - vaidate triangle
#     - raise ArgumentError
#         - if any sides are less than or equal to 0
#         - if the sum of any two sides is not greater than the third side
#
# Method: kind
# input: none
# output: string
#
# rules:
#   - exp:
#      - takes no arguments
#      - determines triangle type based on triangle sides
#      - returns string
#          - triangle type
#
#      - an isoscles triangle has exactly two sides with the same length
#      - an equilateral triangle has three sides with the same length
#      - a scalene triangle has three different length sides
#
#
# data/alg:
# - place the three sides in an array
# - determine how many unique sides the array has - uniq
# - return the corresponding triangle based on the number of unique sides
#

# Main Class
class Triangle
  def initialize(sd1, sd2, sd3)
    @side1 = sd1
    @side2 = sd2
    @side3 = sd3
    validate_triangle
  end

  def kind
    triangle = [@side1, @side2, @side3]

    case triangle.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  private

  def validate_triangle
    triangle = [@side1, @side2, @side3].sort

    raise ArgumentError if triangle.any? { |side| side <= 0 }
    raise ArgumentError if triangle[0, 2].sum <= triangle.max
  end
end
