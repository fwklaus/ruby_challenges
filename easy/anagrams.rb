=begin
Problem: Write a program that takes a word and a list of possible anagrams and selets the correct subls that contains the anagrams of the word

Methods/Classes:
Anagram class
  constructor
  match instance method 

Method: Constructor
input: string 
output: 


Method: Match
input: array of strings
output: array

rules:
  -takes an array of strings
      - possible anagrams to match against value of ivar @word
  - returns an array of strings
      - words that are anagrams of the value for ivar @word
      - if no matches, return an empty array
  
    - identical words are not a match
    - case insensitive
    - words must be an exact match


data/alg:
- create an empty return array
- iterate over the input array
    - convert value of ivar @word to lowercase
    - convert word to lowercase 
        - sort the words and compare them
          - if they are equal add word to return array  
- return sorted array

=end


class Anagram
  def initialize(word)
    @word = word
  end

  def match(arr)
    matches = []
    word = @word.downcase

    arr.each do |wrd|
      lower_wrd = wrd.downcase
      next if word == lower_wrd
      if word.chars.sort == lower_wrd.chars.sort
        matches << wrd
      end
    end

    matches.sort
  end
end