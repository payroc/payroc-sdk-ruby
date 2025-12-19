# frozen_string_literal: true

require_relative "wiremock_test_case"

class PayrocCloudRefundInstructionsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_payroc_cloud_refund_instructions_submit_with_wiremock
    test_id = "payroc_cloud.refund_instructions.submit.0"

    @client.payroc_cloud.refund_instructions.submit(
      serial_number: "1850010868",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      operator: "Jane",
      processing_terminal_id: "1234001",
      order: {
        order_id: "OrderRef6543",
        description: "Refund for order OrderRef6543",
        amount: 4999,
        currency: "USD"
      },
      customization_options: {
        entry_method: "manualEntry"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payroc_cloud.refund_instructions.submit.0"
        }
      }
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

    @client.payroc_cloud.refund_instructions.retrieve(
      refund_instruction_id: "a37439165d134678a9100ebba3b29597",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payroc_cloud.refund_instructions.retrieve.0"
        }
      }
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

    @client.payroc_cloud.refund_instructions.delete(
      refund_instruction_id: "a37439165d134678a9100ebba3b29597",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payroc_cloud.refund_instructions.delete.0"
        }
      }
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
