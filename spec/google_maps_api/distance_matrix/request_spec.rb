require "spec_helper"
require "google_maps_api/distance_matrix/request_lets"

describe GoogleMapsAPI::DistanceMatrix::Request do

  include_context "request lets"

  subject { GoogleMapsAPI::DistanceMatrix::Request.new(origins, destinations, options) }

  describe ".build" do
    subject { GoogleMapsAPI::DistanceMatrix::Request }

    it "builds a new request" do
      expect(subject.build(origins, destinations, options)).to be_a(subject)
    end
  end

  describe "#perform" do
    it "returns a response" do
      expect(subject.perform).to be_a(GoogleMapsAPI::DistanceMatrix::Response)
    end

    it "raises a ResponseError if the response is not successful" do
      allow(subject.http_adapter).to receive(:get_response).and_return(false)
      expect { subject.perform }.to raise_error(GoogleMapsAPI::DistanceMatrix::ResponseError)
    end
  end

  describe "#uri" do
    it "returns a URI" do
      expect(subject.uri).to be_a(URI)
    end
  end

  describe "#scheme" do
    context "when https option is true" do
      subject { GoogleMapsAPI::DistanceMatrix::Request.new(origins, destinations, {https: true}) }

      it "returns 'https'" do
        expect(subject.scheme).to eq('https')
      end
    end

    context "when https option is false" do
      subject { GoogleMapsAPI::DistanceMatrix::Request.new(origins, destinations, {https: false}) }

      it "returns 'http'" do
        expect(subject.scheme).to eq('http')
      end
    end
  end
end
