# frozen_string_literal: true

require_relative "wiremock_test_case"

class CardPaymentsRefundsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_card_payments_refunds_reverse_with_wiremock
    test_id = "card_payments.refunds.reverse.0"

    @client.card_payments.refunds.reverse(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      amount: 4999,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.refunds.reverse.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payments/M2MJOG6O2Y/reverse",
      query_params: nil,
      expected: 1
    )
  end

  def test_card_payments_refunds_create_referenced_refund_with_wiremock
    test_id = "card_payments.refunds.create_referenced_refund.0"

    @client.card_payments.refunds.create_referenced_refund(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      amount: 4999,
      description: "Refund for order OrderRef6543",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.refunds.create_referenced_refund.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payments/M2MJOG6O2Y/refund",
      query_params: nil,
      expected: 1
    )
  end

  def test_card_payments_refunds_list_with_wiremock
    test_id = "card_payments.refunds.list.0"

    @client.card_payments.refunds.list(
      processing_terminal_id: "1234001",
      order_id: "OrderRef6543",
      operator: "Jane",
      cardholder_name: "Sarah%20Hazel%20Hopper",
      first_6: "453985",
      last_4: "7062",
      tender: "ebt",
      date_from: "2024-07-01T15:30:00Z",
      date_to: "2024-07-03T15:30:00Z",
      settlement_state: "settled",
      settlement_date: "2024-07-02",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.refunds.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_card_payments_refunds_create_unreferenced_refund_with_wiremock
    test_id = "card_payments.refunds.create_unreferenced_refund.0"

    @client.card_payments.refunds.create_unreferenced_refund(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      channel: "pos",
      processing_terminal_id: "1234001",
      order: {
        order_id: "OrderRef6543",
        description: "Refund for order OrderRef6543",
        amount: 4999,
        currency: "USD"
      },
      custom_fields: [{
        name: "yourCustomField",
        value: "abc123"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.refunds.create_unreferenced_refund.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/refunds",
      query_params: nil,
      expected: 1
    )
  end

  def test_card_payments_refunds_retrieve_with_wiremock
    test_id = "card_payments.refunds.retrieve.0"

    @client.card_payments.refunds.retrieve(
      refund_id: "CD3HN88U9F",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.refunds.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/refunds/CD3HN88U9F",
      query_params: nil,
      expected: 1
    )
  end

  def test_card_payments_refunds_adjust_with_wiremock
    test_id = "card_payments.refunds.adjust.0"

    @client.card_payments.refunds.adjust(
      refund_id: "CD3HN88U9F",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      operator: "Jane",
      adjustments: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.refunds.adjust.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/refunds/CD3HN88U9F/adjust",
      query_params: nil,
      expected: 1
    )
  end

  def test_card_payments_refunds_reverse_refund_with_wiremock
    test_id = "card_payments.refunds.reverse_refund.0"

    @client.card_payments.refunds.reverse_refund(
      refund_id: "CD3HN88U9F",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.refunds.reverse_refund.0"
        }
      }
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
