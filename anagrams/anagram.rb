require 'pry'

class Anagram
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def match(arr)
    anagrams = []
    word_downcased = word.downcase
    arr.each do |possible_anagram|
      chars = possible_anagram.downcase.split('')
      if chars.sort == word_downcased.split('').sort &&
          word_downcased != possible_anagram.downcase
        anagrams << possible_anagram
      end
    end
    anagrams
  end
end