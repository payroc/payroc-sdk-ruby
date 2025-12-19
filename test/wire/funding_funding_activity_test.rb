# frozen_string_literal: true

require_relative "wiremock_test_case"

class FundingFundingActivityWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_funding_funding_activity_retrieve_balance_with_wiremock
    test_id = "funding.funding_activity.retrieve_balance.0"

    @client.funding.funding_activity.retrieve_balance(
      before: "2571",
      after: "8516",
      limit: 1,
      merchant_id: "4525644354",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_activity.retrieve_balance.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/funding-balance",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_activity_list_with_wiremock
    test_id = "funding.funding_activity.list.0"

    @client.funding.funding_activity.list(
      before: "2571",
      after: "8516",
      limit: 1,
      date_from: "2024-07-02",
      date_to: "2024-07-03",
      merchant_id: "4525644354",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_activity.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/funding-activity",
      query_params: { "dateFrom" => "2024-07-02", "dateTo" => "2024-07-03" },
      expected: 1
    )
  end
end
