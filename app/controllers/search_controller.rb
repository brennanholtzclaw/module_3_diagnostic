class SearchController < ApplicationController

  def index
    connection = Faraday.new(:url => "http://www.nrel.gov/api/alt-fuel-stations/v1/nearest.json?&api_key=#{ENV["NREL_KEY"]}&zip?#{params[:zipcode]}")
    binding.pry
    @results = JSON.parse(connection.get.body)
# binding.pry
  end

end
