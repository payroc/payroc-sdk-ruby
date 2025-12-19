# frozen_string_literal: true

require_relative "wiremock_test_case"

class FundingFundingAccountsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_funding_funding_accounts_list_with_wiremock
    test_id = "funding.funding_accounts.list.0"

    @client.funding.funding_accounts.list(
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_accounts.list.0"
        }
      }
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

    @client.funding.funding_accounts.retrieve(
      funding_account_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_accounts.retrieve.0"
        }
      }
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

    @client.funding.funding_accounts.update(
      funding_account_id: 1,
      type: "checking",
      use: "credit",
      name_on_account: "Jane Doe",
      payment_methods: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_accounts.update.0"
        }
      }
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

    @client.funding.funding_accounts.delete(
      funding_account_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_accounts.delete.0"
        }
      }
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
