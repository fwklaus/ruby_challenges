require "pry"
=begin
PEDAC

PROBLEM: Calculate the hamming distance between two DNA strands

input: string
output: integer
mutating?:

rules:
   -explicit:
       - takes two strings
            - represent DNA strands
            - compare two strings of DNA
       - returns an integer
            - the hamming distance between the two strands
            
      * if the sequences are of different lengths, compute the hamming
        distance over the shorter length
        
   -implicit:
     
unclear parts of problem?:

point mutation: simplest/most common mutation that results in replacing one base with another at a single nucleotide

Hamming distance: the minimum number of point mutations that could have occurred on the evolutionary path between the two strands

- the difference between two homologous DNA strands

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

- The Hamming distance between these two DNA strands is 7.


# The hamming distance is only defined for sequences of equal length
    - compute the hamming distance over the shorter length 

examples/test_cases:

GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
# => 7

GTACATCCGTA
GTACAGTGTCA
     ^^^^^
# => 5

GTGACGTAT
ATGCAATGCAA
^  ^^^ ^^
# => 6
# compute the distance over the shorter length
# disregard the sequence for the longer sequence beyond the length
  of the shorter sequence

data/alg:
compare the differene between two strands of DNA
- difference is based off of the shorter strand

- create a variable to store the hamming distance 
-determine the shorter strand
-iterate over the shorter strand - each_with_index
  - if base pairs at current index are equal continue
  - if base pairs are unique, increment the distance variable by one

=end

class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(otr_strnd)
    distance = 0
    length = determine_strand_length(otr_strnd)

    length.times do |idx|
      distance += 1 unless strand[idx] == otr_strnd[idx]
    end

    distance
  end
  
  private

  def determine_strand_length(strand2)
    sz1 = strand.size
    sz2 = strand2.size

    return sz1 if sz1 == sz2
    sz1 > sz2 ? sz2 : sz1
  end
end

strand1 = DNA.new("GAGCCTACTAACGGGAT")

p strand1.hamming_distance("CATCGTAATGACGGCCT")

