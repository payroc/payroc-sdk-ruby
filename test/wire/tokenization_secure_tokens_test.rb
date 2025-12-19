# frozen_string_literal: true

require_relative "wiremock_test_case"

class TokenizationSecureTokensWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_tokenization_secure_tokens_list_with_wiremock
    test_id = "tokenization.secure_tokens.list.0"

    @client.tokenization.secure_tokens.list(
      processing_terminal_id: "1234001",
      secure_token_id: "MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      customer_name: "Sarah%20Hazel%20Hopper",
      phone: "2025550165",
      email: "sarah.hopper@example.com",
      token: "296753123456",
      first_6: "453985",
      last_4: "7062",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tokenization.secure_tokens.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/secure-tokens",
      query_params: nil,
      expected: 1
    )
  end

  def test_tokenization_secure_tokens_create_with_wiremock
    test_id = "tokenization.secure_tokens.create.0"

    @client.tokenization.secure_tokens.create(
      processing_terminal_id: "1234001",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      operator: "Jane",
      mit_agreement: "unscheduled",
      customer: {
        first_name: "Sarah",
        last_name: "Hopper",
        date_of_birth: "1990-07-15",
        reference_number: "Customer-12",
        billing_address: {
          address_1: "1 Example Ave.",
          address_2: "Example Address Line 2",
          address_3: "Example Address Line 3",
          city: "Chicago",
          state: "Illinois",
          country: "US",
          postal_code: "60056"
        },
        shipping_address: {
          recipient_name: "Sarah Hopper",
          address: {
            address_1: "1 Example Ave.",
            address_2: "Example Address Line 2",
            address_3: "Example Address Line 3",
            city: "Chicago",
            state: "Illinois",
            country: "US",
            postal_code: "60056"
          }
        },
        contact_methods: [],
        notification_language: "en"
      },
      ip_address: {
        type: "ipv4",
        value: "104.18.24.203"
      },
      custom_fields: [{
        name: "yourCustomField",
        value: "abc123"
      }],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tokenization.secure_tokens.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/secure-tokens",
      query_params: nil,
      expected: 1
    )
  end

  def test_tokenization_secure_tokens_retrieve_with_wiremock
    test_id = "tokenization.secure_tokens.retrieve.0"

    @client.tokenization.secure_tokens.retrieve(
      processing_terminal_id: "1234001",
      secure_token_id: "MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tokenization.secure_tokens.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/secure-tokens/MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      query_params: nil,
      expected: 1
    )
  end

  def test_tokenization_secure_tokens_delete_with_wiremock
    test_id = "tokenization.secure_tokens.delete.0"

    @client.tokenization.secure_tokens.delete(
      processing_terminal_id: "1234001",
      secure_token_id: "MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tokenization.secure_tokens.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/processing-terminals/1234001/secure-tokens/MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      query_params: nil,
      expected: 1
    )
  end

  def test_tokenization_secure_tokens_partially_update_with_wiremock
    test_id = "tokenization.secure_tokens.partially_update.0"

    @client.tokenization.secure_tokens.partially_update(
      processing_terminal_id: "1234001",
      secure_token_id: "MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tokenization.secure_tokens.partially_update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/processing-terminals/1234001/secure-tokens/MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      query_params: nil,
      expected: 1
    )
  end

  def test_tokenization_secure_tokens_update_account_with_wiremock
    test_id = "tokenization.secure_tokens.update_account.0"

    @client.tokenization.secure_tokens.update_account(
      processing_terminal_id: "1234001",
      secure_token_id: "MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "tokenization.secure_tokens.update_account.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/secure-tokens/MREF_abc1de23-f4a5-6789-bcd0-12e345678901fa/update-account",
      query_params: nil,
      expected: 1
    )
  end
end
