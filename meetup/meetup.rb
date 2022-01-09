require 'date'
require 'pry'

class Meetup
  DAYS_OF_WEEK = {
    'monday' => 1, 'tuesday' => 2, 'wednesday' => 3, 'thursday' => 4,
    'friday' => 5, 'saturday' => 6, 'sunday' => 0
  }
  OCCURENCE = {
    'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4, 'fifth' => 5
  }
  TEENS = (13..19).to_a
  def initialize(year, month)
    @year = year
    @month = month
    @saved_dates = []
    @numbers_of_occurence = 1
    @week_counter = 0
    @target_date = nil
    @day_of_week = nil
    @occurence = nil
  end

  def day(day_of_week, occurence)
    @occurence = OCCURENCE[occurence.downcase]
    @day_of_week = DAYS_OF_WEEK[day_of_week.downcase]
    @target_date = Date.new(@year, @month, 1)
    check_for_matching_date_loop
  end

  private

  def check_for_matching_date_loop
    loop do
      if @target_date.month != @month
        value = @occurence == 'last' ? @saved_dates.last : nil
        return value
      end
      potential_solution = check_match
      return potential_solution if potential_solution
      @saved_dates << @target_date if @day_of_week == @target_date.wday

      @week_counter = increment_date_and_week_counter
    end
  end

  def increment_date_and_week_counter
    @target_date += 1
    @week_counter += 1
    if @week_counter == 7
      @numbers_of_occurence += 1
      @week_counter = 0
    end
    @week_counter
  end

  def check_match
    if @day_of_week == @target_date.wday &&
       @occurence == @numbers_of_occurence
      return @target_date
    end
    if TEENS.include?(@target_date.day) &&
       @occurence == 'teenth' &&
       @day_of_week == @target_date.wday
      @target_date
    end
  end
end
