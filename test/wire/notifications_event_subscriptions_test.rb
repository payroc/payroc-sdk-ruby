# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class NotificationsEventSubscriptionsWireTest < Minitest::Test
  WIREMOCK_BASE_URL = "http://localhost:8080"
  WIREMOCK_ADMIN_URL = "http://localhost:8080/__admin"

  def setup
    super
    return if ENV["RUN_WIRE_TESTS"] == "true"

    skip "Wire tests are disabled by default. Set RUN_WIRE_TESTS=true to enable them."
  end

  def verify_request_count(test_id:, method:, url_path:, expected:, query_params: nil)
    uri = URI("#{WIREMOCK_ADMIN_URL}/requests/find")
    http = Net::HTTP.new(uri.host, uri.port)
    post_request = Net::HTTP::Post.new(uri.path, { "Content-Type" => "application/json" })

    request_body = { "method" => method, "urlPath" => url_path }
    request_body["headers"] = { "X-Test-Id" => { "equalTo" => test_id } }
    request_body["queryParameters"] = query_params.transform_values { |v| { "equalTo" => v } } if query_params

    post_request.body = request_body.to_json
    response = http.request(post_request)
    result = JSON.parse(response.body)
    requests = result["requests"] || []

    assert_equal expected, requests.length, "Expected #{expected} requests, found #{requests.length}"
  end

  def test_notifications_event_subscriptions_list_with_wiremock
    test_id = "notifications.event_subscriptions.list.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.notifications.event_subscriptions.list(
      event: "processingAccount.status.changed",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "notifications.event_subscriptions.list.0"
                         } }
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

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.notifications.event_subscriptions.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "notifications.event_subscriptions.create.0"
                         } }
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

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.notifications.event_subscriptions.retrieve(
      subscription_id: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "notifications.event_subscriptions.retrieve.0"
                         } }
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

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.notifications.event_subscriptions.update(
      subscription_id: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "notifications.event_subscriptions.update.0"
                         } }
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

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.notifications.event_subscriptions.delete(
      subscription_id: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "notifications.event_subscriptions.delete.0"
                         } }
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

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.notifications.event_subscriptions.partially_update(
      subscription_id: 1,
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "notifications.event_subscriptions.partially_update.0"
                         } }
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
