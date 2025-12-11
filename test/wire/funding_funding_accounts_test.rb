# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class FundingFundingAccountsWireTest < Minitest::Test
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

  def test_funding_funding_accounts_list_with_wiremock
    test_id = "funding.funding_accounts.list.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.funding.funding_accounts.list(
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "funding.funding_accounts.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/funding-accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_accounts_retrieve_with_wiremock
    test_id = "funding.funding_accounts.retrieve.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.funding.funding_accounts.retrieve(
      funding_account_id: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "funding.funding_accounts.retrieve.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/funding-accounts/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_accounts_update_with_wiremock
    test_id = "funding.funding_accounts.update.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.funding.funding_accounts.update(
      funding_account_id: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "funding.funding_accounts.update.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/funding-accounts/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_accounts_delete_with_wiremock
    test_id = "funding.funding_accounts.delete.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.funding.funding_accounts.delete(
      funding_account_id: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "funding.funding_accounts.delete.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/funding-accounts/1",
      query_params: nil,
      expected: 1
    )
  end
end
