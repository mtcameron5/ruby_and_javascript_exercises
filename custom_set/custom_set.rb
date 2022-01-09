require 'pry'

class CustomSet
  attr_reader :set

  def initialize(set=[])
    @set = set
  end

  def empty?
    set.empty?
  end

  def contains?(value)
    set.include? value
  end

  def subset?(other)
    set.each do |element|
      return false unless other.set.include?(element)
    end
    true
  end

  def disjoint?(other)
    set.each do |element|
      return false if other.set.include?(element)
    end
    true
  end

  def eql?(other)
    set.each do |element|
      return false unless other.set.include? element
    end
    other.set.each do |element|
      return false unless set.include? element
    end
    true
  end

  def add(element)
    set << element unless set.include? element
    set
  end

  def ==(other)
    other == set
  end

  def intersection(other)
    result = []
    set.each do |element|
      result << element if other.set.include? element
    end
    result
  end

  def difference(other)
    result = []
    set.each do |element|
      result << element unless other.set.include? element
    end
    result
  end

  def union(other)
    result = set
    other.set.each { |element| result << element }
    result.uniq.sort
  end
end
