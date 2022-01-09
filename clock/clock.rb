class Clock
  attr_accessor :hours, :minutes

  def initialize(hours=0, minutes=0)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    @clock = Clock.new
    @clock.hours = hours
    @clock.minutes = minutes
    @clock
  end

  def +(minutes)
    @minutes += minutes
    while @minutes > 60
      @minutes -= 60
      @hours += 1
    end
    @hours -= 24 while @hours >= 24
    Clock.new(@hours, @minutes)
  end

  def -(minutes)
    @minutes -= minutes
    while @minutes < 0
      @hours -= 1
      @minutes += 60
    end
    @hours += 24 while @hours < 0
    Clock.new(@hours, @minutes)
  end

  def to_s
    hours_formatted = @hours < 10 ? "0#{@hours}" : @hours.to_s
    minutes_formatted = @minutes < 10 ? "0#{@minutes}" : @minutes.to_s
    "#{hours_formatted}:#{minutes_formatted}"
  end

  def ==(other)
    other.hours == hours && other.minutes == minutes
  end
end
