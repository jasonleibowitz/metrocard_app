class MetrocardController < ApplicationController

  def index
    @weekday = params[:weekday].to_i
    @weekend = params[:weekend].to_i
    respond_to do |format|
      binding.pry
      format.html { render text: params.inspect }
      format.json { render json: Metrocard.calculate(@weekday, @weekend).to_json }
    end
  end

end

# Metrocard.calculate(@weekday, @weekend)
