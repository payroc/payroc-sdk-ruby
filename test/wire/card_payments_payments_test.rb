# frozen_string_literal: true

require_relative "wiremock_test_case"

class CardPaymentsPaymentsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_card_payments_payments_list_with_wiremock
    test_id = "card_payments.payments.list.0"

    @client.card_payments.payments.list(
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
      payment_link_id: "JZURRJBUPS",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.payments.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/payments",
      query_params: nil,
      expected: 1
    )
  end

  def test_card_payments_payments_create_with_wiremock
    test_id = "card_payments.payments.create.0"

    @client.card_payments.payments.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      channel: "web",
      processing_terminal_id: "1234001",
      operator: "Jane",
      order: {
        order_id: "OrderRef6543",
        description: "Large Pepperoni Pizza",
        amount: 4999,
        currency: "USD"
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
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.payments.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payments",
      query_params: nil,
      expected: 1
    )
  end

  def test_card_payments_payments_retrieve_with_wiremock
    test_id = "card_payments.payments.retrieve.0"

    @client.card_payments.payments.retrieve(
      payment_id: "M2MJOG6O2Y",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.payments.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/payments/M2MJOG6O2Y",
      query_params: nil,
      expected: 1
    )
  end

  def test_card_payments_payments_adjust_with_wiremock
    test_id = "card_payments.payments.adjust.0"

    @client.card_payments.payments.adjust(
      payment_id: "M2MJOG6O2Y",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      adjustments: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.payments.adjust.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payments/M2MJOG6O2Y/adjust",
      query_params: nil,
      expected: 1
    )
  end

  def test_card_payments_payments_capture_with_wiremock
    test_id = "card_payments.payments.capture.0"

    @client.card_payments.payments.capture(
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
      request_options: {
        additional_headers: {
          "X-Test-Id" => "card_payments.payments.capture.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payments/M2MJOG6O2Y/capture",
      query_params: nil,
      expected: 1
    )
  end
end
