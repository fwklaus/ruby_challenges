require "date"
require "pry"

class Meetup
  attr_reader :year, :month, :days_of_month

  def initialize(year, month)
    @year = year
    @month = month
    @days_of_month = determine_days_for_month.to_a
  end

  def day(dy, dsc)
    day_value = determine_day_value(dy)
    desc_value = determine_desc_value(dsc)
    match = false
    tally = 0

    days_of_month.each do |current_day|
      crnt_day_value = Date.civil(year, month, current_day).wday

      tally += 1 if crnt_day_value == day_value 

      if desc_value == -1
        @day = find_last_day(day_value)
        match = true
        break
      elsif desc_value == (13..19) && desc_value.include?(current_day) &&
            crnt_day_value == day_value
        @day = current_day
        match = true
        break
      elsif tally == desc_value
        @day = current_day
        match = true
        break
      end
    end
    
    return Date.civil(year, month, @day) if match
    nil
  end

  def determine_desc_value(desc)
    desc = desc.downcase
  
    case desc
    when "first"  then 1
    when "second" then 2
    when "third"  then 3
    when "fourth" then 4
    when "fifth"  then 5
    else
      if desc == "teenth"
        (13..19)
      else
        -1
      end
    end
  end
  
  def determine_day_value(day)
    day = day.downcase
    
    case day
    when "sunday"    then 0
    when "monday"    then 1
    when "tuesday"   then 2
    when "wednesday" then 3
    when "thursday"  then 4
    when "friday"    then 5 
    when "saturday"  then 6
    end
  end
  
  def determine_days_for_month
    if Date.civil(@year).leap? && @month == 2
      1..29
    else
      case @month
      when 1  then 1..31
      when 2  then 1..28
      when 3  then 1..31
      when 4  then 1..30
      when 5  then 1..31
      when 6  then 1..30
      when 7  then 1..31
      when 8  then 1..31
      when 9  then 1..30
      when 10 then 1..31
      when 11 then 1..30
      when 12 then 1..31
      end
    end
  end

  def find_last_day(day_value)
    idx = -1

    loop do
      current_day = days_of_month[idx]

      if Date.civil(year, month, current_day).wday == day_value
        return days_of_month.max + idx + 1
      end

      idx -= 1
    end
  end
end

# meet = Meetup.new(2016, 10)

# p meet.day("monday", "teenth")
#  # should return 17


