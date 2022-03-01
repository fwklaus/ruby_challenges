# frozen_string_literal: true

# Compute the scrabble score for a given word
#
# LetterValue
# A, E, I, O, U, L, N, R, S, T	1
# D, G	                        2
# B, C, M, P	                  3
# F, H, V, W, Y	                4
# K	                            5
# J, X	                        8
# Q, Z	                        10
#
# Sum the values of all tiles used in each word according to the above letter values
#
#
# Methods/Classes:
# Scrabble class
#   constructor
#   score instance method
#   class method score
#
#
# Method: Cosntructor
# input: string
#
# takes a string
#    - uses string to initialize ivar @word
#
#
# method: score
# input: nothing
# output: integer
#
# empty @word value return 0
# nil @word value return 0
#
# Create a hash to store the scores
# validate ivar word
#    - return 0 if value is nil or empty?
#
# Class Method: Score
# - same functionality as instance method score
# - takes word as an argument rather than dealing with ivar word
# - instantiate a new Scrabble object from inside the method
# - pass the word passed to self.score as the argument at instantiation
#
#
#

# Scrabble Class
class Scrabble
  SCORES = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }.freeze

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil? || @word.empty? || @word.match?(/[\s+]/)

    score = 0

    @word.chars.each do |char|
      SCORES.each do |wrd_score, arr|
        score += wrd_score if arr.include?(char.upcase)
      end
    end
    score
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end
