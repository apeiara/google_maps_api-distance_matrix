require "spec_helper"
require "google_maps_api/distance_matrix/json_response"

describe GoogleMapsAPI::DistanceMatrix::Row do
  include_context "json response"

  subject { GoogleMapsAPI::DistanceMatrix::Row }

  describe ".from_hash" do
    it "returns a new row" do
      expect(subject.from_hash(parsed_json["rows"].first)).to be_a(subject)
    end
  end
end
