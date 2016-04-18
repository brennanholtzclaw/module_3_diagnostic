class SearchController < ApplicationController

  def index
    @results = Faraday.new(http://www.nrel.gov/api/alt-fuel-stations/v1/nearest.format?parameters)
  end

end
