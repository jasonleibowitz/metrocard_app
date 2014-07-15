@year = Time.now.year
@month = Time.now.month

holidays = JSON.parse(RestClient.get("http://kayaposoft.com/enrico/json/v1.0/?action=getPublicHolidaysForMonth&month=#{month}&year=#{year}&country=usa"))
if holidays.size == 0
  return false
else
  holidays[0]["date"]["dayOfWeek"] <= 5
  # weekday
end
