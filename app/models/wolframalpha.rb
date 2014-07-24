class Wolframalpha

  API = "http://api.wolframalpha.com/v2/query?input=how+many+weekdays+in+the+next+30+days&appid=#{ENV["APP_ID"]}"

  def self.calculate_weekdays_in_next_thirty_days
    HTTParty.get(API)["queryresult"]["pod"][1]["subpod"]["plaintext"].to_i
  end

end
