class GoogleMapsAPI::DistanceMatrix::Element
  attr_reader :status, :duration, :distance

  def initialize(status, duration = nil, distance = nil)
    @status = status
    @duration = duration
    @distance = distance
  end

  def self.from_hash(hash)
    if hash["status"] == "OK"
      new(
        hash["status"],
        GoogleMapsAPI::Core::Duration.from_hash(hash["duration"]),
        GoogleMapsAPI::Core::Distance.from_hash(hash["distance"])
      )
    else
      new(hash["status"])
    end
  end
end
