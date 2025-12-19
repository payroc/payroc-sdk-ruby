# frozen_string_literal: true

require_relative "wiremock_test_case"

class PaymentLinksSharingEventsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_payment_links_sharing_events_list_with_wiremock
    test_id = "payment_links.sharing_events.list.0"

    @client.payment_links.sharing_events.list(
      payment_link_id: "JZURRJBUPS",
      recipient_name: "Sarah Hazel Hopper",
      recipient_email: "sarah.hopper@example.com",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_links.sharing_events.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/payment-links/JZURRJBUPS/sharing-events",
      query_params: nil,
      expected: 1
    )
  end

  def test_payment_links_sharing_events_share_with_wiremock
    test_id = "payment_links.sharing_events.share.0"

    @client.payment_links.sharing_events.share(
      payment_link_id: "JZURRJBUPS",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      sharing_method: "email",
      merchant_copy: true,
      message: 'Dear Sarah,
      Your insurance is expiring this month.
      Please, pay the renewal fee by the end of the month to renew it.
      ',
      recipients: [{
        name: "Sarah Hazel Hopper",
        email: "sarah.hopper@example.com"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payment_links.sharing_events.share.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/payment-links/JZURRJBUPS/sharing-events",
      query_params: nil,
      expected: 1
    )
  end
end
