# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class PaymentsRefundsWireTest < Minitest::Test
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

  def test_payments_refunds_list_with_wiremock
    test_id = "payments.refunds.list.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.refunds.list(
      processing_terminal_id: "1234001",
      order_id: "OrderRef6543",
      operator: "Jane",
      cardholder_name: "Sarah%20Hazel%20Hopper",
      first_6: "453985",
      last_4: "7062",
      date_from: "2024-07-01T15:30:00Z",
      date_to: "2024-07-03T15:30:00Z",
      settlement_date: "2024-07-02",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.refunds.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_refunds_create_with_wiremock
    test_id = "payments.refunds.create.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.refunds.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      processing_terminal_id: "1234001",
      order: {
        order_id: "OrderRef6543",
        description: "Refund for order OrderRef6543",
        amount: 4999
      },
      custom_fields: [{
        name: "yourCustomField",
        value: "abc123"
      }],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.refunds.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_refunds_retrieve_with_wiremock
    test_id = "payments.refunds.retrieve.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.refunds.retrieve(
      refund_id: "CD3HN88U9F",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.refunds.retrieve.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/refunds/CD3HN88U9F",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_refunds_adjust_with_wiremock
    test_id = "payments.refunds.adjust.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.refunds.adjust(
      refund_id: "CD3HN88U9F",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      operator: "Jane",
      adjustments: [],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.refunds.adjust.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/refunds/CD3HN88U9F/adjust",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_refunds_reverse_with_wiremock
    test_id = "payments.refunds.reverse.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.refunds.reverse(
      refund_id: "CD3HN88U9F",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.refunds.reverse.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/refunds/CD3HN88U9F/reverse",
      query_params: nil,
      expected: 1
    )
  end
end
