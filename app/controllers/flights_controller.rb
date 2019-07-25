class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @date_options = Flight.select(:departure).map { |f| f.departure.to_date.to_s }
                                             .uniq
                                             .map { |d| [d, d] }

    begin
      @query_params = params

      from = @query_params[:from_airport_id]
      to = @query_params[:to_airport_id]
      date = Date.parse(@query_params[:departure])
      departure_between = date.beginning_of_day..date.end_of_day

      @flights = Flight.where(from_airport_id: from,
                              to_airport_id:   to,
                              departure:       departure_between).order(departure: :ASC)
    rescue StandardError => e
      @query_params = { from_airport_id: "", to_airport_id: "", departure: "" }
      @flights = []
    end
  end
end
