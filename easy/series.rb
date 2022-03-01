=begin
Write a program that will take a string of digits and return all possible consecutive number series of a specified length in that string

examples:
"01234" (3 digit series):
-012
-123
-234

(4 digit series):
-0123
-1234


# Classes/Methods:
- Series class
   - takes as string at instantiation
- Slices instance method 
    - takes an integer argumnet
        - the size of the slices
    - returns an array of n length sub-arrays
    - throw an error if the slice size is greater than the string size

*Throw an error if the requested digit series is larger than the 
   argument string


# Method: Slices

- input: integer
- output: array of n size sub-arrays

- rules:
    - explicit:
         - take an integer(n)
         - return array of n size sub-arrays
         - throw exception if slice sz is greater than string size

data/alg:
 - take an integer as an arg
 - compare the slice size to the string size
      - throw expection if size is smaller than the slice size
 - create an empty return array
 - iterate over consecutive overlapping sequences - each_cons
    - split the sub-array into characters
    - convert each character to a number
    - push the array to the return array

=end

class Series
  def initialize(str_num)
    @str_num = str_num
  end

  def slices(sz)
    ret_arr = []
    raise ArgumentError if sz > @str_num.size

    @str_num.chars.each_cons(sz) do |seq|
      ret_arr << seq.map(&:to_i)
    end

    ret_arr
  end
end

