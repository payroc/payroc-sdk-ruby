# frozen_string_literal: true

require_relative "wiremock_test_case"

class FundingFundingRecipientsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_funding_funding_recipients_list_with_wiremock
    test_id = "funding.funding_recipients.list.0"

    @client.funding.funding_recipients.list(
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_recipients.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/funding-recipients",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_recipients_create_with_wiremock
    test_id = "funding.funding_recipients.create.0"

    @client.funding.funding_recipients.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      recipient_type: "privateCorporation",
      tax_id: "12-3456789",
      doing_business_as: "Pizza Doe",
      address: {
        address_1: "1 Example Ave.",
        address_2: "Example Address Line 2",
        address_3: "Example Address Line 3",
        city: "Chicago",
        state: "Illinois",
        country: "US",
        postal_code: "60056"
      },
      contact_methods: [],
      metadata: {
        yourCustomField: "abc123"
      },
      owners: [{
        first_name: "Jane",
        middle_name: "Helen",
        last_name: "Doe",
        date_of_birth: "1964-03-22",
        address: {
          address_1: "1 Example Ave.",
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
        }
      }],
      funding_accounts: [{
        type: "checking",
        use: "credit",
        name_on_account: "Jane Doe",
        payment_methods: []
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_recipients.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/funding-recipients",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_recipients_retrieve_with_wiremock
    test_id = "funding.funding_recipients.retrieve.0"

    @client.funding.funding_recipients.retrieve(
      recipient_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_recipients.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/funding-recipients/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_recipients_update_with_wiremock
    test_id = "funding.funding_recipients.update.0"

    @client.funding.funding_recipients.update(
      recipient_id: 1,
      recipient_type: "privateCorporation",
      tax_id: "12-3456789",
      doing_business_as: "Doe Hot Dogs",
      address: {
        address_1: "2 Example Ave.",
        address_2: "Example Address Line 2",
        address_3: "Example Address Line 3",
        city: "Chicago",
        state: "Illinois",
        country: "US",
        postal_code: "60056"
      },
      contact_methods: [],
      metadata: {
        responsiblePerson: "Jane Doe"
      },
      owners: [{
        owner_id: 12_346,
        link: {
          rel: "owner",
          href: "https://api.payroc.com/v1/owners/12346",
          method_: "get"
        }
      }],
      funding_accounts: [{
        funding_account_id: 124,
        status: "approved",
        link: {
          rel: "fundingAccount",
          href: "https://api.payroc.com/v1/funding-accounts/124",
          method_: "get"
        }
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_recipients.update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PUT",
      url_path: "/funding-recipients/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_recipients_delete_with_wiremock
    test_id = "funding.funding_recipients.delete.0"

    @client.funding.funding_recipients.delete(
      recipient_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_recipients.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/funding-recipients/1",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_recipients_list_accounts_with_wiremock
    test_id = "funding.funding_recipients.list_accounts.0"

    @client.funding.funding_recipients.list_accounts(
      recipient_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_recipients.list_accounts.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/funding-recipients/1/funding-accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_recipients_create_account_with_wiremock
    test_id = "funding.funding_recipients.create_account.0"

    @client.funding.funding_recipients.create_account(
      recipient_id: 1,
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      type: "savings",
      use: "credit",
      name_on_account: "Fred Nerk",
      payment_methods: [],
      metadata: {
        responsiblePerson: "Jane Doe"
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_recipients.create_account.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/funding-recipients/1/funding-accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_recipients_list_owners_with_wiremock
    test_id = "funding.funding_recipients.list_owners.0"

    @client.funding.funding_recipients.list_owners(
      recipient_id: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_recipients.list_owners.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/funding-recipients/1/owners",
      query_params: nil,
      expected: 1
    )
  end

  def test_funding_funding_recipients_create_owner_with_wiremock
    test_id = "funding.funding_recipients.create_owner.0"

    @client.funding.funding_recipients.create_owner(
      recipient_id: 1,
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      first_name: "Fred",
      middle_name: "Jim",
      last_name: "Nerk",
      date_of_birth: "1980-01-19",
      address: {
        address_1: "2 Example Ave.",
        city: "Chicago",
        state: "Illinois",
        country: "US",
        postal_code: "60056"
      },
      identifiers: [{
        type: "nationalId",
        value: "000-00-9876"
      }],
      contact_methods: [],
      relationship: {
        equity_percentage: 51.5,
        title: "CEO",
        is_control_prong: false,
        is_authorized_signatory: true
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "funding.funding_recipients.create_owner.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/funding-recipients/1/owners",
      query_params: nil,
      expected: 1
    )
  end
end
