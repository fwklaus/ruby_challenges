require "pry"
=begin
Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

Classes/Methods:
BeerSong class
   - no constructor
self.verse class method
  - takes 1 integer
  - returns a range of verses from first argumnet to second argumnet 
self.verses class method 
  - takes two integers
self.lyrics class method 
   - returns entire song with proper formatting


Method: self.verse

input: integer
output: string


the format of the return string changes depending on the verse
- 99..3 standard verse
- 2, we have to format the output for bottle(s)
- 1, we have to format the output for bottle(s) and it/one
- 0, we have a completley different string 

- need to move the formatting rules to another method 


- take two verses as arguments
- create a range from the first verse to the second
      - return the array by calling self.verse on each verse

=end


class BeerSong
  def self.verse(verse)
    if verse == 0 
      last_verse
    else
      verse2, it_one, bttles1, bttles2 = format(verse)
     
      line1 = "#{verse} #{bttles1} of beer on the wall, #{verse} #{bttles1} of beer.\n"
      line2 = "Take #{it_one} down and pass it around, #{verse2} #{bttles2} of beer on the wall.\n"

      [line1, line2].join
    end
  end

  class << self
    def last_verse
      line1 = "No more bottles of beer on the wall, no more bottles of beer.\n"
      line2 = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      [line1, line2].join
    end

    def format(verse)
      verse2 = (verse - 1) > 0 ? verse - 1 : "no more"
      it_one = verse2 == "no more" ? "it" : "one"
      bttles1 = verse > 1 ? "bottles" : "bottle"
      bttles2 = verse2 == "no more" || verse2 > 1 ? "bottles" : "bottle"
      [verse2, it_one, bttles1, bttles2]
    end
  end

  def self.verses(verse1, verse2)
    vrs = verse1
    song = []
    while vrs >= verse2
      song << verse(vrs)
      vrs -= 1
    end
    song.join("\n")
  end
  
  def self.lyrics
    verses(99, 0)
  end
end


# puts BeerSong.verse(99)
# puts BeerSong.verse(3)
# puts BeerSong.verse(2)
# puts BeerSong.verse(1)
# puts BeerSong.verse(0)

# puts BeerSong.verses(2, 0)

# puts BeerSong.lyrics

# puts BeerSong.verses(99, 98)