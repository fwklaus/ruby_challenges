# Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

# An equilateral triangle has all three sides the same length.

# An isosceles triangle has exactly two sides of the same length.

# A scalene triangle has all sides of different lengths.

# Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.




=begin
PROBLEM: Write a program to determine whether a traingle is equilateral, isosceles, or scalene

input: 3 integers (sides of the triangle)
output: string (output a string which says what the triangle is)
mutating?: no

rules:
   -explicit:
      - takes 3 sides of the triangle
      - output the triangle type
      
      - for a valid triangle 
          - all sides must be greater than 0
             - the sum of the lenghts of any two sides must be greater than the length of the third side
      
unclear parts of problem?:

examples/test_cases:

[2, 2, 3] -> :isosceles
[4, 4, 4] -> :equilateral
[4, 5, 7] -> :scalene
[1, 2, 3] -> :invalid # 1 + 2 equals 3
[0, 4, 3] -> :invalid # all sides must be greater than 0


data/alg:

- create a Triangle class
- instantiate a Triangle object that takes three sides at instantiation
- compare the 3 sides using a case statement

=end

class Triangle
  def initialize(s1, s2, s3)
    if valid_triangle?(s1, s2, s3)
      @side1 = s1
      @side2 = s2
      @side3 = s3
    else
      raise ArgumentError
    end
  end

  def kind
    set_triangle_type if @type == nil
    case @type
    when :equilateral then 'equilateral'
    when :scalene     then 'scalene'
    when :isosceles   then 'isosceles'
    else 
      'invalid'
    end
  end

  private

  def set_triangle_type
    tri =  [@side1, @side2, @side3]

    @type = case
    when tri.uniq.size == 2 then :isosceles 
    when tri.uniq.size == 1 then :equilateral
    else
      :scalene
    end
  end

  def valid_triangle?(s1, s2, s3)
    tri = [s1, s2, s3].sort

    (tri.all? { |el| el > 0}) &&
    (tri[2] < tri[0..1].sum) 
  end
end


# triangle = Triangle.new(2, 2, 3)
# puts triangle.kind

# triangle2 = Triangle.new(4, 4, 4)
# puts triangle2.kind

# triangle3 = Triangle.new(4, 5, 7)
# puts triangle3.kind

# triangle4 = Triangle.new(1, 2, 3)
# puts triangle4.kind

# triangle5 = Triangle.new(0, 4, 3)
# puts triangle5.kind