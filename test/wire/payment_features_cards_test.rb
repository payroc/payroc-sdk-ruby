# frozen_string_literal: true

require_relative "wiremock_test_case"

class PaymentFeaturesCardsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_payment_features_cards_verify_card_with_wiremock
    test_id = "payment_features.cards.verify_card.0"

    @client.payment_features.cards.verify_card(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      processing_terminal_id: "1234001",
      operator: "Jane",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_features.cards.verify_card.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cards/verify",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_features_cards_view_ebt_balance_with_wiremock
    test_id = "payment_features.cards.view_ebt_balance.0"

    @client.payment_features.cards.view_ebt_balance(
      processing_terminal_id: "1234001",
      operator: "Jane",
      currency: "USD",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_features.cards.view_ebt_balance.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cards/balance",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_features_cards_lookup_bin_with_wiremock
    test_id = "payment_features.cards.lookup_bin.0"

    @client.payment_features.cards.lookup_bin(
      processing_terminal_id: "1234001",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_features.cards.lookup_bin.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/cards/bin-lookup",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_features_cards_retrieve_fx_rates_with_wiremock
    test_id = "payment_features.cards.retrieve_fx_rates.0"

    @client.payment_features.cards.retrieve_fx_rates(
      channel: "web",
      processing_terminal_id: "1234001",
      operator: "Jane",
      base_amount: 10_000,
      base_currency: "USD",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_features.cards.retrieve_fx_rates.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/fx-rates",
      query_params: nil,
      expected: 1
    )
  end
end
