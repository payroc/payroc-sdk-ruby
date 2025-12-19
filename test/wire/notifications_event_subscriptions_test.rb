# frozen_string_literal: true

require_relative "wiremock_test_case"

class NotificationsEventSubscriptionsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_notifications_event_subscriptions_list_with_wiremock
    test_id = "notifications.event_subscriptions.list.0"

    @client.notifications.event_subscriptions.list(
      status: "registered",
      event: "processingAccount.status.changed",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "notifications.event_subscriptions.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/event-subscriptions",
      query_params: nil,
      expected: 1
    )
  end

  def test_notifications_event_subscriptions_create_with_wiremock
    test_id = "notifications.event_subscriptions.create.0"

    @client.notifications.event_subscriptions.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      enabled: true,
      event_types: ["processingAccount.status.changed"],
      notifications: [],
      metadata: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "notifications.event_subscriptions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/event-subscriptions",
      query_params: nil,
      expected: 1
    )
  end

  def test_notifications_event_subscriptions_retrieve_with_wiremock
    test_id = "notifications.event_subscriptions.retrieve.0"

    @client.notifications.event_subscriptions.retrieve(
      subscription_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "notifications.event_subscriptions.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/event-subscriptions/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_notifications_event_subscriptions_update_with_wiremock
    test_id = "notifications.event_subscriptions.update.0"

    @client.notifications.event_subscriptions.update(
      subscription_id: 1,
      enabled: true,
      event_types: ["processingAccount.status.changed"],
      notifications: [],
      metadata: {},
      request_options: {
        additional_headers: {
          "X-Test-Id" => "notifications.event_subscriptions.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/event-subscriptions/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_notifications_event_subscriptions_delete_with_wiremock
    test_id = "notifications.event_subscriptions.delete.0"

    @client.notifications.event_subscriptions.delete(
      subscription_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "notifications.event_subscriptions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/event-subscriptions/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_notifications_event_subscriptions_partially_update_with_wiremock
    test_id = "notifications.event_subscriptions.partially_update.0"

    @client.notifications.event_subscriptions.partially_update(
      subscription_id: 1,
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "notifications.event_subscriptions.partially_update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/event-subscriptions/1",
      query_params: nil,
      expected: 1
    )
  end
end
