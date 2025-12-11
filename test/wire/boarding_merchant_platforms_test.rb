# frozen_string_literal: true

require "test_helper"
require "net/http"
require "json"
require "uri"
require "payroc"

class BoardingMerchantPlatformsWireTest < Minitest::Test
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

  def test_boarding_merchant_platforms_list_with_wiremock
    test_id = "boarding.merchant_platforms.list.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.boarding.merchant_platforms.list(
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "boarding.merchant_platforms.list.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/merchant-platforms",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_merchant_platforms_create_with_wiremock
    test_id = "boarding.merchant_platforms.create.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.boarding.merchant_platforms.create(
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      business: {
        name: "Example Corp",
        tax_id: "12-3456789",
        addresses: [{
          address_1: "1 Example Ave.",
          address_2: "Example Address Line 2",
          address_3: "Example Address Line 3",
          city: "Chicago",
          state: "Illinois",
          country: "US",
          postal_code: "60056"
        }],
        contact_methods: []
      },
      processing_accounts: [{
        doing_business_as: "Pizza Doe",
        owners: [{
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
        website: "www.example.com",
        category_code: 5999,
        merchandise_or_service_sold: "Pizza",
        business_start_date: "2020-01-01",
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
        processing: {
          transaction_amounts: {
            average: 5000,
            highest: 10_000
          },
          monthly_amounts: {
            average: 50_000,
            highest: 100_000
          },
          volume_breakdown: {
            card_present_keyed: 47,
            card_present_swiped: 30,
            mail_or_telephone: 3,
            ecommerce: 20
          },
          is_seasonal: true,
          months_of_operation: [],
          ach: {
            naics: "5812",
            previously_terminated_for_ach: false,
            refunds: {
              written_refund_policy: true,
              refund_policy_url: "www.example.com/refund-poilcy-url"
            },
            estimated_monthly_transactions: 3000,
            limits: {
              single_transaction: 10_000,
              daily_deposit: 200_000,
              monthly_deposit: 6_000_000
            },
            transaction_types: [],
            transaction_types_other: "anotherTransactionType"
          },
          card_acceptance: {
            debit_only: false,
            hsa_fsa: false,
            cards_accepted: [],
            speciality_cards: {
              american_express_direct: {
                enabled: true,
                merchant_number: "abc1234567"
              },
              electronic_benefits_transfer: {
                enabled: true,
                fns_number: "6789012"
              },
              other: {
                wex_merchant_number: "abc1234567",
                voyager_merchant_id: "abc1234567",
                fleet_merchant_id: "abc1234567"
              }
            }
          }
        },
        funding: {
          accelerated_funding_fee: 1999,
          daily_discount: false,
          funding_accounts: [{
            name_on_account: "Jane Doe",
            payment_methods: [],
            metadata: {
              yourCustomField: "abc123"
            }
          }]
        },
        contacts: [{
          first_name: "Jane",
          middle_name: "Helen",
          last_name: "Doe",
          identifiers: [{
            value: "000-00-4320"
          }],
          contact_methods: []
        }],
        metadata: {
          customerId: "2345"
        }
      }],
      metadata: {
        customerId: "2345"
      },
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "boarding.merchant_platforms.create.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/merchant-platforms",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_merchant_platforms_retrieve_with_wiremock
    test_id = "boarding.merchant_platforms.retrieve.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.boarding.merchant_platforms.retrieve(
      merchant_platform_id: "12345",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "boarding.merchant_platforms.retrieve.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/merchant-platforms/12345",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_merchant_platforms_list_processing_accounts_with_wiremock
    test_id = "boarding.merchant_platforms.list_processing_accounts.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.boarding.merchant_platforms.list_processing_accounts(
      merchant_platform_id: "12345",
      before: "2571",
      after: "8516",
      limit: 1,
      include_closed: true,
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "boarding.merchant_platforms.list_processing_accounts.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/merchant-platforms/12345/processing-accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_merchant_platforms_create_processing_account_with_wiremock
    test_id = "boarding.merchant_platforms.create_processing_account.0"

    require "payroc"
    client = Payroc::Client.new(api_key: "test-api-key", base_url: WIREMOCK_BASE_URL)
    client.boarding.merchant_platforms.create_processing_account(
      merchant_platform_id: "12345",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: { base_url: WIREMOCK_BASE_URL,
                         additional_headers: {
                           "X-Test-Id" => "boarding.merchant_platforms.create_processing_account.0"
                         } }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/merchant-platforms/12345/processing-accounts",
      query_params: nil,
      expected: 1
    )
  end
end
