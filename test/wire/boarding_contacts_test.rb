# frozen_string_literal: true

require_relative "wiremock_test_case"

class BoardingContactsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_boarding_contacts_retrieve_with_wiremock
    test_id = "boarding.contacts.retrieve.0"

    @client.boarding.contacts.retrieve(
      contact_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.contacts.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/contacts/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_contacts_update_with_wiremock
    test_id = "boarding.contacts.update.0"

    @client.boarding.contacts.update(
      contact_id: 1,
      type: "manager",
      first_name: "Jane",
      middle_name: "Helen",
      last_name: "Doe",
      identifiers: [{
        type: "nationalId",
        value: "000-00-4320"
      }],
      contact_methods: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.contacts.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/contacts/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_contacts_delete_with_wiremock
    test_id = "boarding.contacts.delete.0"

    @client.boarding.contacts.delete(
      contact_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.contacts.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/contacts/1",
      query_params: nil,
      expected: 1
    )
  end
end
