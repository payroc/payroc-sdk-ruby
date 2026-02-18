# frozen_string_literal: true

require_relative "wiremock_test_case"

class AttachmentsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_attachments_upload_to_processing_account_with_wiremock
    test_id = "attachments.upload_to_processing_account.0"

    @client.attachments.upload_to_processing_account(
      processing_account_id: "38765",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "attachments.upload_to_processing_account.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-accounts/38765/attachments",
      query_params: nil,
      expected: 1
    )
  end

  def test_attachments_get_attachment_with_wiremock
    test_id = "attachments.get_attachment.0"

    @client.attachments.get_attachment(
      attachment_id: "12876",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "attachments.get_attachment.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/attachments/12876",
      query_params: nil,
      expected: 1
    )
  end
end
