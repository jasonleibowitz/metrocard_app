class Metrocard

  def self.calculate(weekday, weekend)
    @weekdays = Wolframalpha.calculate_weekdays_in_next_thirty_days
    @weekend_days = 30 - @weekdays
    @subway_rides = (weekday * @weekdays) + (weekend * @weekend_days)
    if @subway_rides >= 48
      return true
    else
      return false
    end
  end

end


