# frozen_string_literal: true

require_relative "wiremock_test_case"

class PaymentFeaturesBankWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_payment_features_bank_verify_with_wiremock
    test_id = "payment_features.bank.verify.0"

    @client.payment_features.bank.verify(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      processing_terminal_id: "1234001",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_features.bank.verify.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank-accounts/verify",
      query_params: nil,
      expected: 1
    )
  end
end
