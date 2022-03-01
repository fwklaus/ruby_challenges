require "pry"
=begin
Create a clock that is independent of date

Should be able to add and sibtract minutes from the time represented by the clock object

Do not use any built-in date or time functionality
     - just use arithmetic operations


Classes/Methods:
-Clock
- constructor
- Class method `at`
    - can take 2 arguments
        - hour, and optional minutes
- instance method to_s
    - displays a string representing integer as time     
- instance method +
- instance method -

calling to_s on an integer will simply convert the number to a string representation of itself

need to instantiate a clock object in the at class method so we can call to_s on the value returned by the method 

Method: +

convert current time to minutes
add the argument to the time_in_minutes
    - if the operation takes you to a total greater than 
      the minutes per day, subtract minutes per day 
       until within valid range
          - use the result for your conversion 
               @hour, @minute = time.divmod(MINUTES_PER_HOUR)

- less than zero, subtract from minutes per day
- greater than zero, add to 0
    - if hour is 00, 12

=end


class Clock
  MINUTES_PER_DAY = 1440
  MINUTES_PER_HOUR = 60

  attr_accessor :hour, :minute

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end

  def self.at(hour, minute=0)
    Clock.new(hour, minute)
  end

  def +(min)
    time_in_minutes = (hour * MINUTES_PER_HOUR) + minute
    time_in_minutes += min
    minutes = get_valid_time(time_in_minutes)
    self.hour, self.minute = minutes.divmod(MINUTES_PER_HOUR)
    self
  end

  def -(min)
    time_in_minutes = (hour * MINUTES_PER_HOUR) + minute
    time_in_minutes -= min
    minutes = get_valid_time(time_in_minutes)
    self.hour, self.minute = minutes.divmod(MINUTES_PER_HOUR)
    self
  end

  def to_s
    format("%02d:%02d", hour, minute)
  end

  def ==(other)
    hour == other.hour && minute == other.minute
  end

  private

  def valid?(time)
    (0..MINUTES_PER_DAY).cover?(time)
  end

  def get_valid_time(total_minutes)
    if total_minutes > MINUTES_PER_DAY
      total_minutes -= MINUTES_PER_DAY until valid?(total_minutes)
    else
      total_minutes += MINUTES_PER_DAY until valid?(total_minutes)
    end
    total_minutes
  end
end

# p Clock.at(8).to_s
# p Clock.at(11, 9).to_s

# clock = Clock.at(10) + 3
# p clock.to_s

# clock = Clock.at(0) - 50
# p clock.to_s

# clock = Clock.at(10) + 61
# p clock.to_s

# clock = Clock.at(0, 30) - 60
# p clock.to_s
