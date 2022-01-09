class SumOfMultiples
  def initialize(*factors)
    @factors = factors == [] ? [3, 5] : factors
  end

  def to(target_number)
    sum = 0
    1.upto(target_number - 1) do |number|
      sum += number if any_multiple? number
    end
    sum
  end

  def self.to(target_number)
    SumOfMultiples.new.to(target_number)
  end

  private

  def any_multiple?(num)
    @factors.any? do |multiple|
      (num % multiple).zero?
    end
  end
end
