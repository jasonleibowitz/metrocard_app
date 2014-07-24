class Metrocard

  def self.calculate(weekday, weekend)
    @days_in_week = HTTParty.get("http://api.wolframalpha.com/v2/query?input=how+many+weekdays+in+the+next+30+days&appid=#{ENV["APP_ID"]}")["queryresult"]["pod"][1]["subpod"]["plaintext"].to_i
    @days_in_weekend = 30 - @days_in_week
    @subway_rides = (weekday.to_i * @days_in_week) + (weekend.to_i * @days_in_weekend)
    if @subway_rides >= 48
      return {text: "You should buy a 30-day metrocard. You will end up using on average #{@subway_rides} rides, which means you would save about $#{"%.2f" % ((@subway_rides - 48) * 2.5).to_i}.", status: "true"}
    else
      return { text: "Do not buy a 30-day metrocard. You will only use #{@subway_rides} rides. You will save $#{"%.2f" % (112 - (@subway_rides * 2.5))} by paying only for the rides you need.", status: "false"}
    end
  end

end
