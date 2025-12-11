# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class PaymentsWireTest < Minitest::Test
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

  def test_payments_list_with_wiremock
    test_id = "payments.list.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.list(
      processing_terminal_id: "1234001",
      order_id: "OrderRef6543",
      operator: "Jane",
      cardholder_name: "Sarah%20Hazel%20Hopper",
      first_6: "453985",
      last_4: "7062",
      date_from: "2024-07-01T15:30:00Z",
      date_to: "2024-07-03T15:30:00Z",
      settlement_date: "2024-07-02",
      payment_link_id: "JZURRJBUPS",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/payments",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_create_with_wiremock
    test_id = "payments.create.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      processing_terminal_id: "1234001",
      operator: "Jane",
      order: {
        order_id: "OrderRef6543",
        description: "Large Pepperoni Pizza",
        amount: 4999
      },
      customer: {
        first_name: "Sarah",
        last_name: "Hopper",
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
        }
      },
      custom_fields: [{
        name: "yourCustomField",
        value: "abc123"
      }],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payments",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_retrieve_with_wiremock
    test_id = "payments.retrieve.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.retrieve(
      payment_id: "M2MJOG6O2Y",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.retrieve.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/payments/M2MJOG6O2Y",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_adjust_with_wiremock
    test_id = "payments.adjust.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.adjust(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      adjustments: [],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.adjust.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payments/M2MJOG6O2Y/adjust",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_capture_with_wiremock
    test_id = "payments.capture.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.capture(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      processing_terminal_id: "1234001",
      operator: "Jane",
      amount: 4999,
      breakdown: {
        subtotal: 4999,
        duty_amount: 499,
        freight_amount: 500,
        items: [{
          unit_price: 4000,
          quantity: 1
        }]
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.capture.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payments/M2MJOG6O2Y/capture",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_reverse_with_wiremock
    test_id = "payments.reverse.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.reverse(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      amount: 4999,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.reverse.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payments/M2MJOG6O2Y/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_refund_with_wiremock
    test_id = "payments.refund.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.refund(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      amount: 4999,
      description: "Refund for order OrderRef6543",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.refund.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payments/M2MJOG6O2Y/refund",
      query_params: nil,
      expected: 1
    )
  end
end
