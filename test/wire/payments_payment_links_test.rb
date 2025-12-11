# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class PaymentsPaymentLinksWireTest < Minitest::Test
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

  def test_payments_payment_links_list_with_wiremock
    test_id = "payments.payment_links.list.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.payment_links.list(
      processing_terminal_id: "1234001",
      merchant_reference: "LinkRef6543",
      recipient_name: "Sarah Hazel Hopper",
      recipient_email: "sarah.hopper@example.com",
      created_on: "2024-07-02",
      expires_on: "2024-08-02",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.payment_links.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/payment-links",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_payment_links_create_with_wiremock
    test_id = "payments.payment_links.create.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.payment_links.create(
      processing_terminal_id: "1234001",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.payment_links.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/payment-links",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_payment_links_retrieve_with_wiremock
    test_id = "payments.payment_links.retrieve.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.payment_links.retrieve(
      payment_link_id: "JZURRJBUPS",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.payment_links.retrieve.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/payment-links/JZURRJBUPS",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_payment_links_partially_update_with_wiremock
    test_id = "payments.payment_links.partially_update.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.payment_links.partially_update(
      payment_link_id: "JZURRJBUPS",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.payment_links.partially_update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/payment-links/JZURRJBUPS",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_payment_links_deactivate_with_wiremock
    test_id = "payments.payment_links.deactivate.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.payment_links.deactivate(
      payment_link_id: "JZURRJBUPS",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.payment_links.deactivate.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment-links/JZURRJBUPS/deactivate",
      query_params: nil,
      expected: 1
    )
  end
end
