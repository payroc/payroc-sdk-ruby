# frozen_string_literal: true

require_relative "wiremock_test_case"

class BankTransferPaymentsPaymentsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_bank_transfer_payments_payments_list_with_wiremock
    test_id = "bank_transfer_payments.payments.list.0"

    @client.bank_transfer_payments.payments.list(
      processing_terminal_id: "1234001",
      order_id: "OrderRef6543",
      name_on_account: "Sarah%20Hazel%20Hopper",
      last_4: "7890",
      date_from: "2024-07-01T00:00:00Z",
      date_to: "2024-07-31T23:59:59Z",
      settlement_state: "settled",
      settlement_date: "2024-07-15",
      payment_link_id: "JZURRJBUPS",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer_payments.payments.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/bank-transfer-payments",
      query_params: { "processingTerminalId" => "1234001" },
      expected: 1
    )
  end

  def test_bank_transfer_payments_payments_create_with_wiremock
    test_id = "bank_transfer_payments.payments.create.0"

    @client.bank_transfer_payments.payments.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      processing_terminal_id: "1234001",
      order: {
        order_id: "OrderRef6543",
        description: "Large Pepperoni Pizza",
        amount: 4999,
        currency: "USD",
        breakdown: {
          subtotal: 4347,
          tip: {
            type: "percentage",
            percentage: 10
          },
          taxes: [{
            type: "rate",
            rate: 5,
            name: "Sales Tax"
          }]
        }
      },
      customer: {
        notification_language: "en",
        contact_methods: []
      },
      credential_on_file: {
        tokenize: true
      },
      custom_fields: [{
        name: "yourCustomField",
        value: "abc123"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer_payments.payments.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank-transfer-payments",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_payments_payments_retrieve_with_wiremock
    test_id = "bank_transfer_payments.payments.retrieve.0"

    @client.bank_transfer_payments.payments.retrieve(
      payment_id: "M2MJOG6O2Y",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer_payments.payments.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/bank-transfer-payments/M2MJOG6O2Y",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_payments_payments_represent_with_wiremock
    test_id = "bank_transfer_payments.payments.represent.0"

    @client.bank_transfer_payments.payments.represent(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer_payments.payments.represent.0"
        }
      }
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
