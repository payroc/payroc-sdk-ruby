# frozen_string_literal: true

require_relative "wiremock_test_case"

class PaymentLinksWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_payment_links_list_with_wiremock
    test_id = "payment_links.list.0"

    @client.payment_links.list(
      processing_terminal_id: "1234001",
      merchant_reference: "LinkRef6543",
      link_type: "multiUse",
      charge_type: "preset",
      status: "active",
      recipient_name: "Sarah Hazel Hopper",
      recipient_email: "sarah.hopper@example.com",
      created_on: "2024-07-02",
      expires_on: "2024-08-02",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_links.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/payment-links",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_links_create_with_wiremock
    test_id = "payment_links.create.0"

    @client.payment_links.create(
      processing_terminal_id: "1234001",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_links.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/payment-links",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_links_retrieve_with_wiremock
    test_id = "payment_links.retrieve.0"

    @client.payment_links.retrieve(
      payment_link_id: "JZURRJBUPS",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_links.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/payment-links/JZURRJBUPS",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_links_partially_update_with_wiremock
    test_id = "payment_links.partially_update.0"

    @client.payment_links.partially_update(
      payment_link_id: "JZURRJBUPS",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_links.partially_update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/payment-links/JZURRJBUPS",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_links_deactivate_with_wiremock
    test_id = "payment_links.deactivate.0"

    @client.payment_links.deactivate(
      payment_link_id: "JZURRJBUPS",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_links.deactivate.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment-links/JZURRJBUPS/deactivate",
      query_params: nil,
      expected: 1
    )
  end
end
