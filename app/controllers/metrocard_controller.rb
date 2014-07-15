class MetrocardController < ApplicationController

  def index
    @weekday = params[:weekday]
    @weekend = params[:weekend]
    respond_to do |format|
      format.html { render text: params.inspect }
      format.json { render text: Metrocard.calculate(@weekday, @weekend).to_json }
    end
  end

end

# Metrocard.calculate(@weekday, @weekend)
