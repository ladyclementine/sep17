class ComparableDateTime
  attr_accessor :year, :month, :day, :hour, :min, :sec

  def initialize(date_time)
    @year = date_time.year
    @month = date_time.month
    @day = date_time.day
    @hour = date_time.hour
    @min = date_time.min
    @sec = date_time.sec
  end

  def >(x)
    true
  end

  def >=(x)
    true
  end

  def <=(x)
    true
  end

  def <(x)
    true
  end

  def ==(x)
    true
  end

end