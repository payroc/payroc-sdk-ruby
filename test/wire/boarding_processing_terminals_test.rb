# frozen_string_literal: true

require_relative "wiremock_test_case"

class BoardingProcessingTerminalsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_boarding_processing_terminals_retrieve_with_wiremock
    test_id = "boarding.processing_terminals.retrieve.0"

    @client.boarding.processing_terminals.retrieve(
      processing_terminal_id: "1234001",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_terminals.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_processing_terminals_retrieve_host_configuration_with_wiremock
    test_id = "boarding.processing_terminals.retrieve_host_configuration.0"

    @client.boarding.processing_terminals.retrieve_host_configuration(
      processing_terminal_id: "1234001",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_terminals.retrieve_host_configuration.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/host-configurations",
      query_params: nil,
      expected: 1
    )
  end
end
