class FlightsController < ApplicationController
  def index
    @flights = Flight.search(params)
    @airports = Flight.list_all_airports
    @dates = Flight.list_all_flight_dates
    @passengers = (1..4).map { |p| [ p.to_s + " passenger".pluralize(p), p] }
  end
  
  def search
  end
end
