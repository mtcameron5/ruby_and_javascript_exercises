class Robot
  @@names = []

  def initialize
    @name = nil
  end

  def name
    return @name if @name
    loop do
      @name = build_name
      unless @@names.include? @name
        @@names << @name
        break
      end
    end
    @name
  end

  def build_name
    name = ''
    2.times { |_| name += ('A'..'Z').to_a.sample }
    3.times { |_| name += ('0'..'9').to_a.sample }
    name
  end

  def reset
    @name = nil
  end
end
