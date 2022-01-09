class Series
  def initialize(number)
    @number = number
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > @number.size
    answer = []
    (@number.size - slice_size + 1).times do |index|
      arr = []
      arr.push @number[index].to_i
      add_to_arr(arr, slice_size, index)
      answer << arr
    end
    answer
  end

  private

  def add_to_arr(arr, slice_size, index)
    (slice_size - 1).times do |counter|
      new_index = index + counter + 1
      arr.push @number[new_index].to_i
    end
    arr
  end
end
