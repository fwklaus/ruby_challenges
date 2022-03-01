require "pry"
=begin
Print a diamond
    - class takes a lettter as inout
    - outputs diamond shape


Method: self.make_diamond
inpout: string letter
output: diamond

- letter is uppercase
- output starts with A, and features the supplied letter letter in the row at the widest point

The first row contains one 'A'.
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

Method: self.make_diamond
input: letter
output: print diamond

takes a string letter
    - uppercase
all diamonds will contain an odd number of rows
the supplied letter row will always occupy the middle row

- the heighth and the width of the diamond are equal
  - the height and width are the lenght of the range, minus 1

examples:

C -->
  A
 B B
C   C
 B B
  A

E -->
    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A
  

alg:    
- create a range from A to the supplied letter
- iterate over the range to create first half
- iteragte from the back up to but not including the first element 
   for the second half

- divide the lenght of the row by 2
    - 9 / 2 == 4
        - 4 gives us the element we do not want to replace with 
          -empty space
- for the first row we divide by 2
- for the second row, we devide by 2, and subtract 1, and add 1 to the middle
- etc. 


=end


class Diamond
  def self.make_diamond(letter)
    diamond = []
    letters = ("A"..letter).to_a
    row_length = ((letters.size * 2) - 1)
     
    diamond << create_first_half(letters, row_length)

    unless row_length == 1
      diamond << create_second_half(letters, row_length)
    end
    
    

    return_arr = []

    rw = 0
    while rw < diamond.size
      middle_idx = diamond.size / 2

      if rw < middle_idx + 1
        high_idx = (diamond.size / 2) + rw
        low_idx = (diamond.size / 2) - rw
      else
        high_idx = (diamond.size / 2) - (rw/2)
        low_idx = (diamond.size / 2) + (rw/2)
      end
      r = diamond[rw]

      new_diamond_row = r.map.with_index do |el, idx|
        if diamond[rw] == diamond.first || diamond[rw] == diamond.last
          if idx == middle_idx
            el
          else 
            ' '
          end
        else
          if idx == high_idx || idx == low_idx
            el
          else
            ' '
          end
        end
      end
      return_arr << new_diamond_row
      rw += 1
    end

    binding.pry
    
    diamond = return_arr.map(&:join)
    puts diamond.join("\n")
  end

  class << self

  private
  def create_first_half(letters, row_length)
    return [letters[0]] if row_length == 1
    diamond = []

    letters.each do |ltr|
      row = []
      row_length.times { row << ltr }
      diamond << row
    end
    diamond 
  end

  def create_second_half(letters, row_length)
    diamond = []

    idx = -2 
    until letters[(idx + 1).abs] == nil
      row = []
      row_length.times { row << letters[idx]}
      diamond << row
      idx -= 1
    end
    diamond
  end
end
end

# Diamond.make_diamond("A")
=begin

A

=end

Diamond.make_diamond("C")
