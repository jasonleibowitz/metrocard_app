class Metrocard

  def self.calculate(weekday, weekend)
    @days_in_week = HTTParty.get("http://api.wolframalpha.com/v2/query?input=how+many+weekdays+in+the+next+30+days&appid=VRJQG6-9KT48V8X8E")["queryresult"]["pod"][1]["subpod"]["plaintext"].to_i
    @days_in_weekend = 30 - @days_in_week
    @subway_rides = (weekday.to_i * @days_in_week) + (weekend.to_i * @days_in_weekend)
    if @subway_rides >= 48
      return {text: "You should buy a 30-days metrocard. You will end up using on average #{@subway_rides} rides.", status: "true"}
    else
      return { text: "Do not buy a 30-day metrocard. You will only use #{@subway_rides} rides.", status: "false"}
    end
  end

end
