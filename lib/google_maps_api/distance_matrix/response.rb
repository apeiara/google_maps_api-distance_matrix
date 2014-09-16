require "json"

class GoogleMapsAPI::DistanceMatrix::Response
  attr_reader :status, :origin_addresses, :destination_addresses, :rows, :json_response

  def initialize(status, origin_addresses, destination_addresses, rows, json_response)
    @status = status
    @origin_addresses = origin_addresses
    @destination_addresses = destination_addresses
    @rows = rows
    @json_response = json_response
  end

  def self.from_json(json)
    parsed_json = parse_json(json)
    rows = build_rows(parsed_json)
    self.new(
      parsed_json['status'],
      parsed_json['origin_addresses'],
      parsed_json['destination_addresses'],
      rows,
      json
    )
  end

  private

  def self.parse_json(json)
    JSON.parse(json)
  end

  def self.build_rows(parsed_json)
    parsed_json['rows'].collect do |r|
      GoogleMapsAPI::DistanceMatrix::Row.from_hash(r)
    end
  end
end
