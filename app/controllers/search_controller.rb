class SearchController < ApplicationController
  # respond_to :json
  def index
    connection = Faraday.new(:url => "http://www.nrel.gov/api/alt-fuel-stations/v1/nearest.json?&api_key=#{ENV["NREL_KEY"]}&zip?#{params[:zipcode]}&limit=10")
binding.pry
    @results = JSON.parse(connection.get.body)
    # respond_with @results

  end

end
