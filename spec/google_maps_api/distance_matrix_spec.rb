require "spec_helper"
require "google_maps_api/distance_matrix/request_lets"

describe GoogleMapsAPI::DistanceMatrix do
  subject { GoogleMapsAPI::DistanceMatrix }

  include_context "request lets"

  describe ".calculate" do
    it "performs a request" do
      expect_any_instance_of(subject::Request).to receive(:perform).with(no_args)
      subject.calculate(origins, destinations, options)
    end

    it "returns a response" do
      expect(subject.calculate(origins, destinations, options)).to be_a(subject::Response)
    end
  end

end
