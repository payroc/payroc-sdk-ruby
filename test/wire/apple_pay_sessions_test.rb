# frozen_string_literal: true

require_relative "wiremock_test_case"

class ApplePaySessionsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_apple_pay_sessions_create_with_wiremock
    test_id = "apple_pay_sessions.create.0"

    @client.apple_pay_sessions.create(
      processing_terminal_id: "1234001",
      apple_domain_id: "DUHDZJHGYY",
      apple_validation_url: "https://apple-pay-gateway.apple.com/paymentservices/startSession",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "apple_pay_sessions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/apple-pay-sessions",
      query_params: nil,
      expected: 1
    )
  end
end
