# frozen_string_literal: true

require_relative "wiremock_test_case"

class AuthWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_auth_retrieve_token_with_wiremock
    test_id = "auth.retrieve_token.0"

    @client.auth.retrieve_token(
      api_key: "x-api-key",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "auth.retrieve_token.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/authorize",
      query_params: nil,
      expected: 1
    )
  end
end
