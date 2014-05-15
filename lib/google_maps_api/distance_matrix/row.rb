class GoogleMapsAPI::DistanceMatrix::Row
  attr_reader :elements

  def initialize(elements)
    @elements = elements
  end

  def self.from_hash(hash)
    self.new(build_elements(hash))
  end

  private

  def self.build_elements(hash)
    hash["elements"].collect do |e|
      GoogleMapsAPI::DistanceMatrix::Element.from_hash(e)
    end
  end
end
