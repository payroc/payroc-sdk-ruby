# frozen_string_literal: true

require_relative "wiremock_test_case"

class BoardingProcessingAccountsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_boarding_processing_accounts_retrieve_with_wiremock
    test_id = "boarding.processing_accounts.retrieve.0"

    @client.boarding.processing_accounts.retrieve(
      processing_account_id: "38765",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_accounts.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-accounts/38765",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_processing_accounts_list_processing_account_funding_accounts_with_wiremock
    test_id = "boarding.processing_accounts.list_processing_account_funding_accounts.0"

    @client.boarding.processing_accounts.list_processing_account_funding_accounts(
      processing_account_id: "38765",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_accounts.list_processing_account_funding_accounts.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-accounts/38765/funding-accounts",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_processing_accounts_list_contacts_with_wiremock
    test_id = "boarding.processing_accounts.list_contacts.0"

    @client.boarding.processing_accounts.list_contacts(
      processing_account_id: "38765",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_accounts.list_contacts.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-accounts/38765/contacts",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_processing_accounts_get_processing_account_pricing_agreement_with_wiremock
    test_id = "boarding.processing_accounts.get_processing_account_pricing_agreement.0"

    @client.boarding.processing_accounts.get_processing_account_pricing_agreement(
      processing_account_id: "38765",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_accounts.get_processing_account_pricing_agreement.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-accounts/38765/pricing",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_processing_accounts_list_owners_with_wiremock
    test_id = "boarding.processing_accounts.list_owners.0"

    @client.boarding.processing_accounts.list_owners(
      processing_account_id: "38765",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_accounts.list_owners.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-accounts/38765/owners",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_processing_accounts_create_reminder_with_wiremock
    test_id = "boarding.processing_accounts.create_reminder.0"

    @client.boarding.processing_accounts.create_reminder(
      processing_account_id: "38765",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_accounts.create_reminder.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-accounts/38765/reminders",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_processing_accounts_list_terminal_orders_with_wiremock
    test_id = "boarding.processing_accounts.list_terminal_orders.0"

    @client.boarding.processing_accounts.list_terminal_orders(
      processing_account_id: "38765",
      status: "open",
      from_date_time: "2024-09-08T12:00:00Z",
      to_date_time: "2024-12-08T11:00:00Z",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_accounts.list_terminal_orders.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-accounts/38765/terminal-orders",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_processing_accounts_create_terminal_order_with_wiremock
    test_id = "boarding.processing_accounts.create_terminal_order.0"

    @client.boarding.processing_accounts.create_terminal_order(
      processing_account_id: "38765",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      training_provider: "payroc",
      shipping: {
        preferences: {
          method_: "nextDay",
          saturday_delivery: true
        },
        address: {
          recipient_name: "Recipient Name",
          business_name: "Company Ltd",
          address_line_1: "1 Example Ave.",
          address_line_2: "Example Address Line 2",
          city: "Chicago",
          state: "Illinois",
          postal_code: "60056",
          email: "example@mail.com",
          phone: "2025550164"
        }
      },
      order_items: [{
        type: "solution",
        solution_template_id: "Roc Services_DX8000",
        solution_quantity: 1,
        device_condition: "new",
        solution_setup: {
          timezone: "America/Chicago",
          industry_template_id: "Retail",
          gateway_settings: {
            merchant_portfolio_id: "Company Ltd",
            merchant_template_id: "Company Ltd Merchant Template",
            user_template_id: "Company Ltd User Template",
            terminal_template_id: "Company Ltd Terminal Template"
          },
          application_settings: {
            clerk_prompt: false,
            security: {
              refund_password: true,
              keyed_sale_password: false,
              reversal_password: true
            }
          },
          device_settings: {
            number_of_mobile_users: 2,
            communication_type: "wifi"
          },
          receipt_notifications: {
            email_receipt: true,
            sms_receipt: false
          },
          taxes: [{
            tax_rate: 6,
            tax_label: "Sales Tax"
          }],
          tips: {
            enabled: false
          },
          tokenization: true
        }
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_accounts.create_terminal_order.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-accounts/38765/terminal-orders",
      query_params: nil,
      expected: 1
    )
  end

  def test_boarding_processing_accounts_list_processing_terminals_with_wiremock
    test_id = "boarding.processing_accounts.list_processing_terminals.0"

    @client.boarding.processing_accounts.list_processing_terminals(
      processing_account_id: "38765",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "boarding.processing_accounts.list_processing_terminals.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-accounts/38765/processing-terminals",
      query_params: nil,
      expected: 1
    )
  end
end
