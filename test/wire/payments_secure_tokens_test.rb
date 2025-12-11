# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class PaymentsSecureTokensWireTest < Minitest::Test
  WIREMOCK_BASE_URL = "http://localhost:8080"
  WIREMOCK_ADMIN_URL = "http://localhost:8080/__admin"

  def setup
    super
    return if ENV["RUN_WIRE_TESTS"] == "true"

    skip "Wire tests are disabled by default. Set RUN_WIRE_TESTS=true to enable them."
  end

  def verify_request_count(test_id:, method:, url_path:, expected:, query_params: nil)
    uri = URI("#{WIREMOCK_ADMIN_URL}/requests/find")
    http = Net::HTTP.new(uri.host, uri.port)
    post_request = Net::HTTP::Post.new(uri.path, { "Content-Type" => "application/json" })

    request_body = { "method" => method, "urlPath" => url_path }
    request_body["headers"] = { "X-Test-Id" => { "equalTo" => test_id } }
    request_body["queryParameters"] = query_params.transform_values { |v| { "equalTo" => v } } if query_params

    post_request.body = request_body.to_json
    response = http.request(post_request)
    result = JSON.parse(response.body)
    requests = result["requests"] || []

    assert_equal expected, requests.length, "Expected #{expected} requests, found #{requests.length}"
  end

  def test_payments_secure_tokens_list_with_wiremock
    test_id = "payments.secure_tokens.list.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.secure_tokens.list(
      processing_terminal_id: "1234001",
      secure_token_id: "MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      customer_name: "Sarah%20Hazel%20Hopper",
      phone: "2025550165",
      email: "sarah.hopper@example.com",
      token: "296753123456",
      first_6: "453985",
      last_4: "7062",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.secure_tokens.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/secure-tokens",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_secure_tokens_create_with_wiremock
    test_id = "payments.secure_tokens.create.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.secure_tokens.create(
      processing_terminal_id: "1234001",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      operator: "Jane",
      customer: {
        first_name: "Sarah",
        last_name: "Hopper",
        date_of_birth: "1990-07-15",
        reference_number: "Customer-12",
        billing_address: {
          address_1: "1 Example Ave.",
          address_2: "Example Address Line 2",
          address_3: "Example Address Line 3",
          city: "Chicago",
          state: "Illinois",
          country: "US",
          postal_code: "60056"
        },
        shipping_address: {
          recipient_name: "Sarah Hopper",
          address: {
            address_1: "1 Example Ave.",
            address_2: "Example Address Line 2",
            address_3: "Example Address Line 3",
            city: "Chicago",
            state: "Illinois",
            country: "US",
            postal_code: "60056"
          }
        },
        contact_methods: []
      },
      ip_address: {
        value: "104.18.24.203"
      },
      custom_fields: [{
        name: "yourCustomField",
        value: "abc123"
      }],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.secure_tokens.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/secure-tokens",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_secure_tokens_retrieve_with_wiremock
    test_id = "payments.secure_tokens.retrieve.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.secure_tokens.retrieve(
      processing_terminal_id: "1234001",
      secure_token_id: "MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.secure_tokens.retrieve.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/secure-tokens/MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_secure_tokens_delete_with_wiremock
    test_id = "payments.secure_tokens.delete.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.secure_tokens.delete(
      processing_terminal_id: "1234001",
      secure_token_id: "MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.secure_tokens.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/processing-terminals/1234001/secure-tokens/MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_secure_tokens_partially_update_with_wiremock
    test_id = "payments.secure_tokens.partially_update.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.secure_tokens.partially_update(
      processing_terminal_id: "1234001",
      secure_token_id: "MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.secure_tokens.partially_update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/processing-terminals/1234001/secure-tokens/MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_secure_tokens_update_account_with_wiremock
    test_id = "payments.secure_tokens.update_account.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.secure_tokens.update_account(
      processing_terminal_id: "1234001",
      secure_token_id: "MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.secure_tokens.update_account.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/secure-tokens/MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa/update-account",
      query_params: nil,
      expected: 1
    )
  end
end
