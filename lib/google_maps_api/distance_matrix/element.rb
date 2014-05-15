class GoogleMapsAPI::DistanceMatrix::Element
  attr_reader :status, :duration, :distance

  def initialize(status, duration, distance)
    @status = status
    @duration = duration
    @distance = distance
  end

  def self.from_hash(hash)
    self.new(
      hash["status"],
      GoogleMapsAPI::Core::Duration.from_hash(hash["duration"]),
      GoogleMapsAPI::Core::Distance.from_hash(hash["distance"])
    )
  end
end
