require "spec_helper"
require "google_maps_api/distance_matrix/json_response"

describe GoogleMapsAPI::DistanceMatrix::Element do
  include_context "json response"

  subject { GoogleMapsAPI::DistanceMatrix::Element }

  describe ".from_hash" do
    it "returns a new element" do
      expect(subject.from_hash(parsed_json["rows"].first["elements"].first)).to be_a(subject)
    end

    it "handles 'ZERO_RESULTS' status" do
      element = subject.from_hash(parsed_json["rows"].first["elements"][1])

      expect(element).to be_a(subject)
      expect(element.status).to eq("ZERO_RESULTS")
      expect(element.distance).to be_nil
      expect(element.duration).to be_nil
    end
  end
end
