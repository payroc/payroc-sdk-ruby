# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class PaymentsBankTransferPaymentsWireTest < Minitest::Test
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

  def test_payments_bank_transfer_payments_list_with_wiremock
    test_id = "payments.bank_transfer_payments.list.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.bank_transfer_payments.list(
      processing_terminal_id: "1234001",
      order_id: "OrderRef6543",
      name_on_account: "Sarah%20Hazel%20Hopper",
      last_4: "7890",
      date_from: "2024-07-01T00:00:00Z",
      date_to: "2024-07-31T23:59:59Z",
      settlement_date: "2024-07-15",
      payment_link_id: "JZURRJBUPS",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.bank_transfer_payments.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/bank-transfer-payments",
      query_params: { "processingTerminalId" => "1234001" },
      expected: 1
    )
  end

  def test_payments_bank_transfer_payments_create_with_wiremock
    test_id = "payments.bank_transfer_payments.create.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.bank_transfer_payments.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      processing_terminal_id: "1234001",
      order: {
        order_id: "OrderRef6543",
        description: "Large Pepperoni Pizza",
        amount: 4999,
        breakdown: {
          subtotal: 4347,
          tip: {
            percentage: 10
          },
          taxes: [{
            rate: 5,
            name: "Sales Tax"
          }]
        }
      },
      customer: {
        contact_methods: []
      },
      credential_on_file: {
        tokenize: true
      },
      custom_fields: [{
        name: "yourCustomField",
        value: "abc123"
      }],
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.bank_transfer_payments.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank-transfer-payments",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_bank_transfer_payments_retrieve_with_wiremock
    test_id = "payments.bank_transfer_payments.retrieve.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.bank_transfer_payments.retrieve(
      payment_id: "M2MJOG6O2Y",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.bank_transfer_payments.retrieve.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/bank-transfer-payments/M2MJOG6O2Y",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_bank_transfer_payments_reverse_with_wiremock
    test_id = "payments.bank_transfer_payments.reverse.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.bank_transfer_payments.reverse(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.bank_transfer_payments.reverse.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank-transfer-payments/M2MJOG6O2Y/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_bank_transfer_payments_refund_with_wiremock
    test_id = "payments.bank_transfer_payments.refund.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.bank_transfer_payments.refund(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      amount: 4999,
      description: "amount to refund",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.bank_transfer_payments.refund.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank-transfer-payments/M2MJOG6O2Y/refund",
      query_params: nil,
      expected: 1
    )
  end

  def test_payments_bank_transfer_payments_represent_with_wiremock
    test_id = "payments.bank_transfer_payments.represent.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.payments.bank_transfer_payments.represent(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "payments.bank_transfer_payments.represent.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank-transfer-payments/M2MJOG6O2Y/represent",
      query_params: nil,
      expected: 1
    )
  end
end
