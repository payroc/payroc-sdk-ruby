# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class PaymentsSubscriptionsWireTest < Minitest::Test
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

  def test_payments_subscriptions_list_with_wiremock
    test_id = "payments.subscriptions.list.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.subscriptions.list(
      processing_terminal_id: "1234001",
      customer_name: "Sarah%20Hazel%20Hopper",
      last_4: "7062",
      payment_plan: "Premium%20Club",
      end_date: "2025-07-01",
      next_due_date: "2024-08-01",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.subscriptions.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/subscriptions",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_subscriptions_create_with_wiremock
    test_id = "payments.subscriptions.create.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.subscriptions.create(
      processing_terminal_id: "1234001",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      subscription_id: "SubRef7654",
      payment_plan_id: "PlanRef8765",
      name: "Premium Club",
      description: "Premium Club subscription",
      setup_order: {
        order_id: "OrderRef6543",
        amount: 4999,
        description: "Initial setup fee for Premium Club subscription"
      },
      recurring_order: {
        amount: 4999,
        description: "Monthly Premium Club subscription",
        breakdown: {
          subtotal: 4347,
          taxes: [{
            rate: 5,
            name: "Sales Tax"
          }]
        }
      },
      start_date: "2024-07-02",
      end_date: "2025-07-01",
      length: 12,
      pause_collection_for: 0,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.subscriptions.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/subscriptions",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_subscriptions_retrieve_with_wiremock
    test_id = "payments.subscriptions.retrieve.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.subscriptions.retrieve(
      processing_terminal_id: "1234001",
      subscription_id: "SubRef7654",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.subscriptions.retrieve.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/subscriptions/SubRef7654",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_subscriptions_partially_update_with_wiremock
    test_id = "payments.subscriptions.partially_update.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.subscriptions.partially_update(
      processing_terminal_id: "1234001",
      subscription_id: "SubRef7654",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.subscriptions.partially_update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/processing-terminals/1234001/subscriptions/SubRef7654",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_subscriptions_deactivate_with_wiremock
    test_id = "payments.subscriptions.deactivate.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.subscriptions.deactivate(
      processing_terminal_id: "1234001",
      subscription_id: "SubRef7654",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.subscriptions.deactivate.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/subscriptions/SubRef7654/deactivate",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_subscriptions_reactivate_with_wiremock
    test_id = "payments.subscriptions.reactivate.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.subscriptions.reactivate(
      processing_terminal_id: "1234001",
      subscription_id: "SubRef7654",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.subscriptions.reactivate.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/subscriptions/SubRef7654/reactivate",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_subscriptions_pay_with_wiremock
    test_id = "payments.subscriptions.pay.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.subscriptions.pay(
      processing_terminal_id: "1234001",
      subscription_id: "SubRef7654",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      operator: "Jane",
      order: {
        order_id: "OrderRef6543",
        amount: 4999,
        description: "Monthly Premium Club subscription"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.subscriptions.pay.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/subscriptions/SubRef7654/pay",
      query_params: nil,
      expected: 1
    )
  end
end
