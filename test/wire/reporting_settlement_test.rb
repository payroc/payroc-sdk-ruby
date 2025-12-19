# frozen_string_literal: true

require_relative "wiremock_test_case"

class ReportingSettlementWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_reporting_settlement_list_batches_with_wiremock
    test_id = "reporting.settlement.list_batches.0"

    @client.reporting.settlement.list_batches(
      before: "2571",
      after: "8516",
      limit: 1,
      date: "2027-07-02",
      merchant_id: "4525644354",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.list_batches.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/batches",
      query_params: { "date" => "2027-07-02" },
      expected: 1
    )
  end

  def test_reporting_settlement_retrieve_batch_with_wiremock
    test_id = "reporting.settlement.retrieve_batch.0"

    @client.reporting.settlement.retrieve_batch(
      batch_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.retrieve_batch.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/batches/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_settlement_list_transactions_with_wiremock
    test_id = "reporting.settlement.list_transactions.0"

    @client.reporting.settlement.list_transactions(
      before: "2571",
      after: "8516",
      limit: 1,
      date: "2024-07-02",
      batch_id: 1,
      merchant_id: "4525644354",
      transaction_type: "Capture",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.list_transactions.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/transactions",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_settlement_retrieve_transaction_with_wiremock
    test_id = "reporting.settlement.retrieve_transaction.0"

    @client.reporting.settlement.retrieve_transaction(
      transaction_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.retrieve_transaction.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/transactions/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_settlement_list_authorizations_with_wiremock
    test_id = "reporting.settlement.list_authorizations.0"

    @client.reporting.settlement.list_authorizations(
      before: "2571",
      after: "8516",
      limit: 1,
      date: "2024-07-02",
      batch_id: 1,
      merchant_id: "4525644354",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.list_authorizations.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/authorizations",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_settlement_retrieve_authorization_with_wiremock
    test_id = "reporting.settlement.retrieve_authorization.0"

    @client.reporting.settlement.retrieve_authorization(
      authorization_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.retrieve_authorization.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/authorizations/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_settlement_list_disputes_with_wiremock
    test_id = "reporting.settlement.list_disputes.0"

    @client.reporting.settlement.list_disputes(
      before: "2571",
      after: "8516",
      limit: 1,
      date: "2024-07-02",
      merchant_id: "4525644354",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.list_disputes.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/disputes",
      query_params: { "date" => "2024-07-02" },
      expected: 1
    )
  end

  def test_reporting_settlement_list_disputes_statuses_with_wiremock
    test_id = "reporting.settlement.list_disputes_statuses.0"

    @client.reporting.settlement.list_disputes_statuses(
      dispute_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.list_disputes_statuses.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/disputes/1/statuses",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_settlement_list_ach_deposits_with_wiremock
    test_id = "reporting.settlement.list_ach_deposits.0"

    @client.reporting.settlement.list_ach_deposits(
      before: "2571",
      after: "8516",
      limit: 1,
      date: "2024-07-02",
      merchant_id: "4525644354",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.list_ach_deposits.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/ach-deposits",
      query_params: { "date" => "2024-07-02" },
      expected: 1
    )
  end

  def test_reporting_settlement_retrieve_ach_deposit_with_wiremock
    test_id = "reporting.settlement.retrieve_ach_deposit.0"

    @client.reporting.settlement.retrieve_ach_deposit(
      ach_deposit_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.retrieve_ach_deposit.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/ach-deposits/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_reporting_settlement_list_ach_deposit_fees_with_wiremock
    test_id = "reporting.settlement.list_ach_deposit_fees.0"

    @client.reporting.settlement.list_ach_deposit_fees(
      before: "2571",
      after: "8516",
      limit: 1,
      date: "2024-07-02",
      ach_deposit_id: 1,
      merchant_id: "4525644354",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "reporting.settlement.list_ach_deposit_fees.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/ach-deposit-fees",
      query_params: nil,
      expected: 1
    )
  end
end
