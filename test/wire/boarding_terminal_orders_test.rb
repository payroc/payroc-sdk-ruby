# frozen_string_literal: true

require_relative "wiremock_test_case"

class BoardingTerminalOrdersWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_boarding_terminal_orders_retrieve_with_wiremock
    test_id = "boarding.terminal_orders.retrieve.0"

    @client.boarding.terminal_orders.retrieve(
      terminal_order_id: "12345",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.terminal_orders.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/terminal-orders/12345",
      query_params: nil,
      expected: 1
    )
  end
end
