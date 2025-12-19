# frozen_string_literal: true

require_relative "wiremock_test_case"

class BoardingPricingIntentsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_boarding_pricing_intents_list_with_wiremock
    test_id = "boarding.pricing_intents.list.0"

    @client.boarding.pricing_intents.list(
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.pricing_intents.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/pricing-intents",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_pricing_intents_create_with_wiremock
    test_id = "boarding.pricing_intents.create.0"

    @client.boarding.pricing_intents.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      key: "Your-Unique-Identifier",
      metadata: {
        yourCustomField: "abc123"
      },
      country: "US",
      version: "5.0",
      base: {
        address_verification: 5,
        annual_fee: {
          bill_in_month: "june",
          amount: 9900
        },
        regulatory_assistance_program: 15,
        pci_non_compliance: 4995,
        merchant_advantage: 10,
        maintenance: 500,
        minimum: 100,
        voice_authorization: 95,
        chargeback: 2500,
        retrieval: 1500,
        batch: 1500,
        early_termination: 57_500
      },
      processor: {},
      services: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.pricing_intents.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/pricing-intents",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_pricing_intents_retrieve_with_wiremock
    test_id = "boarding.pricing_intents.retrieve.0"

    @client.boarding.pricing_intents.retrieve(
      pricing_intent_id: "5",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.pricing_intents.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/pricing-intents/5",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_pricing_intents_update_with_wiremock
    test_id = "boarding.pricing_intents.update.0"

    @client.boarding.pricing_intents.update(
      pricing_intent_id: "5",
      key: "Your-Unique-Identifier",
      metadata: {
        yourCustomField: "abc123"
      },
      country: "US",
      version: "5.0",
      base: {
        address_verification: 5,
        annual_fee: {
          bill_in_month: "june",
          amount: 9900
        },
        regulatory_assistance_program: 15,
        pci_non_compliance: 4995,
        merchant_advantage: 10,
        maintenance: 500,
        minimum: 100,
        voice_authorization: 95,
        chargeback: 2500,
        retrieval: 1500,
        batch: 1500,
        early_termination: 57_500
      },
      processor: {
        ach: {
          fees: {
            transaction: 50,
            batch: 5,
            returns: 400,
            unauthorized_return: 1999,
            statement: 800,
            monthly_minimum: 20_000,
            account_verification: 10,
            discount_rate_under_10000: 5.25,
            discount_rate_above_10000: 10
          }
        }
      },
      gateway: {
        fees: {
          monthly: 2000,
          setup: 5000,
          per_transaction: 2000,
          per_device_monthly: 10
        }
      },
      services: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.pricing_intents.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/pricing-intents/5",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_pricing_intents_delete_with_wiremock
    test_id = "boarding.pricing_intents.delete.0"

    @client.boarding.pricing_intents.delete(
      pricing_intent_id: "5",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.pricing_intents.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/pricing-intents/5",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_pricing_intents_partially_update_with_wiremock
    test_id = "boarding.pricing_intents.partially_update.0"

    @client.boarding.pricing_intents.partially_update(
      pricing_intent_id: "5",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.pricing_intents.partially_update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/pricing-intents/5",
      query_params: nil,
      expected: 1
    )
  end
end
