# frozen_string_literal: true

require_relative "wiremock_test_case"

class HostedFieldsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_hosted_fields_create_with_wiremock
    test_id = "hosted_fields.create.0"

    @client.hosted_fields.create(
      processing_terminal_id: "1234001",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      lib_version: "1.1.0.123456",
      scenario: "payment",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "hosted_fields.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/hosted-fields-sessions",
      query_params: nil,
      expected: 1
    )
  end
end
