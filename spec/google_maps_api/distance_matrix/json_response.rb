require "json"

shared_context "json response" do
  let(:json) { File.read("#{File.dirname(__FILE__)}/response_mock.json") }
  let(:parsed_json) { JSON.parse(json) }
end
