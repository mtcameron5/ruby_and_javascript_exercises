class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    differences = 0
    strands = [strand, distance].sort { |strand1, strand2| strand1.length <=> strand2.length }
    strands.first.chars.each_with_index do |char, index|
      differences += 1 if char != strands.last[index]
    end
    differences
  end

  private

  attr_reader :strand
end

x = DNA.new('FFF')
p x.hamming_distance('FFFFF')