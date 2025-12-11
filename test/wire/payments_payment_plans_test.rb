# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class PaymentsPaymentPlansWireTest < Minitest::Test
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

  def test_payments_payment_plans_list_with_wiremock
    test_id = "payments.payment_plans.list.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.payment_plans.list(
      processing_terminal_id: "1234001",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.payment_plans.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/payment-plans",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_payment_plans_create_with_wiremock
    test_id = "payments.payment_plans.create.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.payment_plans.create(
      processing_terminal_id: "1234001",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.payment_plans.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/payment-plans",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_payment_plans_retrieve_with_wiremock
    test_id = "payments.payment_plans.retrieve.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.payment_plans.retrieve(
      processing_terminal_id: "1234001",
      payment_plan_id: "PlanRef8765",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.payment_plans.retrieve.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/payment-plans/PlanRef8765",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_payment_plans_delete_with_wiremock
    test_id = "payments.payment_plans.delete.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.payment_plans.delete(
      processing_terminal_id: "1234001",
      payment_plan_id: "PlanRef8765",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.payment_plans.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/processing-terminals/1234001/payment-plans/PlanRef8765",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_payment_plans_partially_update_with_wiremock
    test_id = "payments.payment_plans.partially_update.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.payment_plans.partially_update(
      processing_terminal_id: "1234001",
      payment_plan_id: "PlanRef8765",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.payment_plans.partially_update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/processing-terminals/1234001/payment-plans/PlanRef8765",
      query_params: nil,
      expected: 1
    )
  end
end
