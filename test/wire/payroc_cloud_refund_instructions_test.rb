# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class PayrocCloudRefundInstructionsWireTest < Minitest::Test
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

  def test_payroc_cloud_refund_instructions_submit_with_wiremock
    test_id = "payroc_cloud.refund_instructions.submit.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payroc_cloud.refund_instructions.submit(
      serial_number: "1850010868",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      operator: "Jane",
      processing_terminal_id: "1234001",
      order: {
        order_id: "OrderRef6543",
        description: "Refund for order OrderRef6543",
        amount: 4999
      },
      customization_options: {},
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payroc_cloud.refund_instructions.submit.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/devices/1850010868/refund-instructions",
      query_params: nil,
      expected: 1
    )
  end

  def test_payroc_cloud_refund_instructions_retrieve_with_wiremock
    test_id = "payroc_cloud.refund_instructions.retrieve.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payroc_cloud.refund_instructions.retrieve(
      refund_instruction_id: "a37439165d134678a9100ebba3b29597",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payroc_cloud.refund_instructions.retrieve.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/refund-instructions/a37439165d134678a9100ebba3b29597",
      query_params: nil,
      expected: 1
    )
  end

  def test_payroc_cloud_refund_instructions_delete_with_wiremock
    test_id = "payroc_cloud.refund_instructions.delete.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payroc_cloud.refund_instructions.delete(
      refund_instruction_id: "a37439165d134678a9100ebba3b29597",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payroc_cloud.refund_instructions.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/refund-instructions/a37439165d134678a9100ebba3b29597",
      query_params: nil,
      expected: 1
    )
  end
end
