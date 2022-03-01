require "pry"
=begin
Write a progrm that converts modern decimal numbers into their Roman numeral equivalents

Do not need to convert numbers larger than 3000

Written by expressing each digit speratley starting with the left most digit and skipping anyy digit with a value of zero


examples:

1990
1000 -> M
900 -> CM
90 -> XC

2008
2000 -> MM
8 -> VIII


I - 1
V - 5
X - 10
L - 50
C - 100
D - 500
M - 1000


Classes/Methods:

- RomanNumeral class
    - takes an integer at instantiation
    - from 0 to 3000
- to_roman instance method
    - returns a string
        - the integer converted to Roman numerals


Method: to_roman

Convert integer to roman numeral

input: integer
output: string

rules:
   - explcit:
       - takes an integer 
            1-3000
       - returns a string
            number converted to Roman Numeral


data/alg:

- take the value of the @num instance variable
    - convert to a string

- need to break the number into whole numbers
    - split the string to characters
    - create a count
    - while the counter is less than the size of the number
        - iterate over the number
        - create an empty array to store the current number
        - if the number is not 0
             - add 0s to the length of the number to equal the size of the array
             - add the joined number to a return array
        
- How do we then convert our while numbers to Roman Numerals?
    - Could we use Regex?
       - We are only dealing with whole numbers
          from 1 - 3000
       - The Numeral is determined by the number of zeroes
         and the first number which can only be from 1-9
       - There can only be a max of 3 zeroes


example:

400
- We check the number first
          -from 1 - 3 - add
          -4     - subtract
          - 5         - base
- then we match the zeroes

4 -> IV
40 -> XL
400 -> CD




3000

There are 3 zeroes -> MMM

200

There are 2 zeroes -> CC

450

CDL



- check the leading number first 

1     I
10    X
100   C
1000

2
20
200
2000

3
30
300
3000


iterate over each number in the array
    - check the first number of the current number
    - for each number match against an array of possible 
      numbers 
        - 1, 10, 100, 1000
        - return the correct transformation
         

=end

class RomanNumeral
  def initialize(num)
    @num = num
  end

  def to_roman
    whole_arr = get_whole_nums
    whole_arr.map do |num|
      convert(num)
    end.join
  end

  private
  def convert(num)
    case num[0]
    when "1" then convert1(num) 
    when "2" then convert2(num)
    when "3" then convert3(num)
    when "4" then convert4(num)
    when "5" then convert5(num) 
    when "6" then convert6(num)
    when "7" then convert7(num)
    when "8" then convert8(num)
    when "9" then convert9(num)
    end
  end

  def convert1(num)
    case num
    when '1'    then 'I'
    when '10'   then 'X'
    when '100'  then 'C'
    when '1000' then 'M'
    end
  end

  def convert2(num)
    case num
    when '2'    then 'II'
    when '20'   then 'XX'
    when '200'  then 'CC'
    when '2000' then 'MM'
    end
  end

  def convert3(num)
    case num
    when '3'    then 'III'
    when '30'   then 'XXX'
    when '300'  then 'CCC'
    when '3000' then 'MMM'
    end
  end

  def convert4(num) 
    case num
    when '4'    then 'IV'
    when '40'   then 'XL'
    when '400'  then 'CD'
    end
  end

  def convert5(num) 
    case num
    when '5'    then 'V'
    when '50'   then 'L'
    when '500'  then 'D'
    end
  end

  def convert6(num) 
    case num
    when '6'    then 'VI'
    when '60'   then 'LX'
    when '600'  then 'DC'
    end
  end

  def convert7(num) 
    case num
    when '7'    then 'VII'
    when '70'   then 'LXX'
    when '700'  then 'DCC'
    end
  end

  def convert8(num) 
    case num
    when '8'    then 'VIII'
    when '80'   then 'LXXX'
    when '800'  then 'DCCC'
    end
  end

  def convert9(num) 
    case num
    when '9'    then 'IX'
    when '90'   then 'XC'
    when '900'  then 'CM'
    end
  end

  def get_whole_nums
    num_arr = @num.digits.map(&:to_s)
    whole_nums = []
    num_arr.each_with_index do |el, idx|
      whole_nums.unshift(el + ('0' * idx)) unless el == '0'
    end
    whole_nums
  end
end



# num = RomanNumeral.new(27)

# p num.to_roman