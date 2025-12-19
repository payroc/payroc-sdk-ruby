# frozen_string_literal: true

require_relative "wiremock_test_case"

class TokenizationSingleUseTokensWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_tokenization_single_use_tokens_create_with_wiremock
    test_id = "tokenization.single_use_tokens.create.0"

    @client.tokenization.single_use_tokens.create(
      processing_terminal_id: "1234001",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      channel: "web",
      operator: "Jane",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tokenization.single_use_tokens.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/single-use-tokens",
      query_params: nil,
      expected: 1
    )
  end
end
