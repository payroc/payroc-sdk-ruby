# frozen_string_literal: true

require_relative "wiremock_test_case"

class FundingFundingInstructionsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_funding_funding_instructions_list_with_wiremock
    test_id = "funding.funding_instructions.list.0"

    @client.funding.funding_instructions.list(
      before: "2571",
      after: "8516",
      limit: 1,
      date_from: "2024-07-01",
      date_to: "2024-07-03",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_instructions.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/funding-instructions",
      query_params: { "dateFrom" => "2024-07-01", "dateTo" => "2024-07-03" },
      expected: 1
    )
  end

  def test_funding_funding_instructions_create_with_wiremock
    test_id = "funding.funding_instructions.create.0"

    @client.funding.funding_instructions.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_instructions.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/funding-instructions",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_instructions_retrieve_with_wiremock
    test_id = "funding.funding_instructions.retrieve.0"

    @client.funding.funding_instructions.retrieve(
      instruction_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_instructions.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/funding-instructions/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_instructions_update_with_wiremock
    test_id = "funding.funding_instructions.update.0"

    @client.funding.funding_instructions.update(
      instruction_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_instructions.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/funding-instructions/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_instructions_delete_with_wiremock
    test_id = "funding.funding_instructions.delete.0"

    @client.funding.funding_instructions.delete(
      instruction_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_instructions.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/funding-instructions/1",
      query_params: nil,
      expected: 1
    )
  end
end
