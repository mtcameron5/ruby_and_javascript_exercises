class PerfectNumber
  def initialize(number)
    raise StandardError unless number > 0
    @number = number
    @divisors = []
    find_divisors
  end

  def classify
    return 'deficient' if @divisors.sum < @number
    return 'perfect' if @divisors.sum == @number
    return 'abundant'
  end

  def self.classify(number)
    PerfectNumber.new(number).classify
  end

  private

  def find_divisors
    1.upto(@number - 1) do |divisor|
      @divisors << divisor if @number % divisor == 0
    end
  end
end