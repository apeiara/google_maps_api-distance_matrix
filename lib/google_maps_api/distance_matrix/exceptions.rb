class GoogleMapsAPI::DistanceMatrix::Error < StandardError; end

class GoogleMapsAPI::DistanceMatrix::ResponseError < GoogleMapsAPI::DistanceMatrix::Error
  attr_accessor :response
end
