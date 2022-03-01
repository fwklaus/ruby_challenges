# frozen_string_literal: true

# Calculate the Hamming distance between two DNA strands
#
# Point Mutation - the simplest and most common type of nucleic acid mutation
#     - replaces one base point with another at a single nucleotide
# Hamming Distance
#     - the number of point mutations between two strands
#
# example:
# GAGCCTACTAACGGGAT
# CATCGTAATGACGGCCT
# ^ ^ ^  ^ ^    ^^
# Hamming distance of 7
#
# - For sequences of unequal length, compute the hamming distance over the shorter length
#
# classes/methods:
# class DNA
#   constructor
#   instance method hamming_distance
#
# Method: constructor
# input: string
# output: none
#
# takes a DNA sequence string and assigns it to an instance variable
#
# Method: hamming_distance
# input: takes a string
# output: integer
#
# rules:
#    - exp:
#        - take a string as input:
#            - DNA strand
#        - returns an integer
#           - the Hamming Distance between the two strands
#
# data/alg:
#  - create a hamming distance variable
#  - determine the length of the shorter string - n
#     - iterate n times - times
#       - at n index
#           - compare the string for each strand
#               - if there's a difference, increment the tally
#  - return the hamming distance tally
#

# Main class
class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(strand2)
    shorter = strand.size > strand2.size ? strand2.size : strand.size
    hamming = 0

    shorter.times do |idx|
      hamming += 1 if strand[idx] != strand2[idx]
    end

    hamming
  end
end
