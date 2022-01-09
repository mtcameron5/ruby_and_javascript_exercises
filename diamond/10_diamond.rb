require 'pry'

class Diamond
  counter = 0
  LETTERS = {}
  ('A'..'Z').to_a.each do |letter|
    LETTERS[letter] = counter
    counter += 1
  end
  LETTERS_ARR = LETTERS.keys

  def self.make_diamond(starting_letter)
    Diamond.new.make_diamond(starting_letter)
  end

  def make_diamond(starting_letter)
    distance_from_a = LETTERS[starting_letter]
    outer_spaces = distance_from_a

    diamond = " " * outer_spaces + 'A' + " " * outer_spaces + "\n"
    diamond = draw_top_portion(diamond, distance_from_a)
    diamond = draw_bottom_portion(diamond, distance_from_a)
    if distance_from_a > 0
      diamond += " " * outer_spaces + 'A' + " " * outer_spaces + "\n"
    end

    diamond
  end

  def draw_top_portion(diamond, starting_distance)
    outer_spaces = starting_distance
    inner_spaces = 1
    1.upto(starting_distance) do |index|
      outer_spaces -= 1
      diamond += " " * outer_spaces + LETTERS_ARR[index] + " " * inner_spaces \
         + LETTERS_ARR[index] + " " * outer_spaces + "\n"
      inner_spaces += 2
    end
    diamond
  end

  def draw_bottom_portion(diamond, starting_distance)
    inner_spaces = starting_distance * 2 - 1
    outer_spaces = 0
    (starting_distance - 1).downto(1) do |index|
      outer_spaces += 1
      inner_spaces -= 2
      diamond += " " * outer_spaces + LETTERS_ARR[index] + " " * inner_spaces \
      + LETTERS_ARR[index] + " " * outer_spaces + "\n"
    end
    diamond
  end
end
