require "google_maps_api/distance_matrix/version"
require "google_maps_api/distance_matrix/request"
require "google_maps_api/distance_matrix/response"
require "google_maps_api/distance_matrix/row"
require "google_maps_api/distance_matrix/element"
require "google_maps_api/distance_matrix/exceptions"
require "google_maps_api/core"

module GoogleMapsAPI
  module DistanceMatrix
    def self.calculate(origins, destinations, options = {})
      request = Request.build(origins, destinations, options)
      request.perform
    end
  end
end
