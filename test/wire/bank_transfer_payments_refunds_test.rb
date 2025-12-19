# frozen_string_literal: true

require_relative "wiremock_test_case"

class BankTransferPaymentsRefundsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_bank_transfer_payments_refunds_reverse_payment_with_wiremock
    test_id = "bank_transfer_payments.refunds.reverse_payment.0"

    @client.bank_transfer_payments.refunds.reverse_payment(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer_payments.refunds.reverse_payment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank-transfer-payments/M2MJOG6O2Y/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_payments_refunds_refund_with_wiremock
    test_id = "bank_transfer_payments.refunds.refund.0"

    @client.bank_transfer_payments.refunds.refund(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      amount: 4999,
      description: "amount to refund",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer_payments.refunds.refund.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank-transfer-payments/M2MJOG6O2Y/refund",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_payments_refunds_list_with_wiremock
    test_id = "bank_transfer_payments.refunds.list.0"

    @client.bank_transfer_payments.refunds.list(
      processing_terminal_id: "1234001",
      order_id: "OrderRef6543",
      name_on_account: "Sarah%20Hazel%20Hopper",
      last_4: "7062",
      date_from: "2024-07-01T00:00:00Z",
      date_to: "2024-07-31T23:59:59Z",
      settlement_state: "settled",
      settlement_date: "2024-07-15",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer_payments.refunds.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/bank-transfer-refunds",
      query_params: { "processingTerminalId" => "1234001" },
      expected: 1
    )
  end

  def test_bank_transfer_payments_refunds_create_with_wiremock
    test_id = "bank_transfer_payments.refunds.create.0"

    @client.bank_transfer_payments.refunds.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      processing_terminal_id: "1234001",
      order: {
        order_id: "OrderRef6543",
        description: "Refund for order OrderRef6543",
        amount: 4999,
        currency: "USD"
      },
      customer: {
        notification_language: "en",
        contact_methods: []
      },
      custom_fields: [{
        name: "yourCustomField",
        value: "abc123"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer_payments.refunds.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank-transfer-refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_payments_refunds_retrieve_with_wiremock
    test_id = "bank_transfer_payments.refunds.retrieve.0"

    @client.bank_transfer_payments.refunds.retrieve(
      refund_id: "CD3HN88U9F",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer_payments.refunds.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/bank-transfer-refunds/CD3HN88U9F",
      query_params: nil,
      expected: 1
    )
  end

  def test_bank_transfer_payments_refunds_reverse_refund_with_wiremock
    test_id = "bank_transfer_payments.refunds.reverse_refund.0"

    @client.bank_transfer_payments.refunds.reverse_refund(
      refund_id: "CD3HN88U9F",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "bank_transfer_payments.refunds.reverse_refund.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/bank-transfer-refunds/CD3HN88U9F/reverse",
      query_params: nil,
      expected: 1
    )
  end
end
