# frozen_string_literal: true

require_relative "wiremock_test_case"

class BoardingOwnersWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_boarding_owners_retrieve_with_wiremock
    test_id = "boarding.owners.retrieve.0"

    @client.boarding.owners.retrieve(
      owner_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.owners.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/owners/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_owners_update_with_wiremock
    test_id = "boarding.owners.update.0"

    @client.boarding.owners.update(
      owner_id: 1,
      first_name: "Jane",
      middle_name: "Helen",
      last_name: "Doe",
      date_of_birth: "1964-03-22",
      address: {
        address_1: "1 Example Ave.",
        address_2: "Example Address Line 2",
        address_3: "Example Address Line 3",
        city: "Chicago",
        state: "Illinois",
        country: "US",
        postal_code: "60056"
      },
      identifiers: [{
        type: "nationalId",
        value: "000-00-4320"
      }],
      contact_methods: [],
      relationship: {
        equity_percentage: 48.5,
        title: "CFO",
        is_control_prong: true,
        is_authorized_signatory: false
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.owners.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/owners/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_owners_delete_with_wiremock
    test_id = "boarding.owners.delete.0"

    @client.boarding.owners.delete(
      owner_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.owners.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/owners/1",
      query_params: nil,
      expected: 1
    )
  end
end
