class Octal
  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 unless valid_octal?(@number)
    decimal_value = 0
    @number.to_i.digits.each_with_index do |digit, index|
      decimal_value += 8**index * digit
    end
    decimal_value
  end

  private

  def valid_octal?(num)
    num.chars.all? { |n| n =~ /[0-7]/ }
  end
end
