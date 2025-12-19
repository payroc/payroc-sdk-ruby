# frozen_string_literal: true

require_relative "wiremock_test_case"

class PayrocCloudSignatureInstructionsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_payroc_cloud_signature_instructions_submit_with_wiremock
    test_id = "payroc_cloud.signature_instructions.submit.0"

    @client.payroc_cloud.signature_instructions.submit(
      serial_number: "1850010868",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      processing_terminal_id: "1234001",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payroc_cloud.signature_instructions.submit.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/devices/1850010868/signature-instructions",
      query_params: nil,
      expected: 1
    )
  end

  def test_payroc_cloud_signature_instructions_retrieve_with_wiremock
    test_id = "payroc_cloud.signature_instructions.retrieve.0"

    @client.payroc_cloud.signature_instructions.retrieve(
      signature_instruction_id: "a37439165d134678a9100ebba3b29597",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payroc_cloud.signature_instructions.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/signature-instructions/a37439165d134678a9100ebba3b29597",
      query_params: nil,
      expected: 1
    )
  end

  def test_payroc_cloud_signature_instructions_delete_with_wiremock
    test_id = "payroc_cloud.signature_instructions.delete.0"

    @client.payroc_cloud.signature_instructions.delete(
      signature_instruction_id: "a37439165d134678a9100ebba3b29597",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payroc_cloud.signature_instructions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/signature-instructions/a37439165d134678a9100ebba3b29597",
      query_params: nil,
      expected: 1
    )
  end
end
