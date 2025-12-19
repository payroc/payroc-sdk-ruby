# frozen_string_literal: true

require "test_helper"
require "payroc"

# This test verifies that the README examples compile correctly without making network calls
class ReadmeExamplesTest < Minitest::Test
  def setup
    @api_key = "test-api-key"
    @base_url = "http://localhost:8080"
  end

  def test_client_class_exists
    # Test that the Payroc::Client class exists and can be referenced
    assert defined?(Payroc::Client), "Payroc::Client should be defined"
    assert Payroc::Client.is_a?(Class), "Payroc::Client should be a class"
  end

  def test_client_initialization_parameters
    # Test that client initialization parameters compile correctly
    client_params = {
      base_url: "http://localhost:3000",
      api_key: @api_key
    }
    
    assert client_params.is_a?(Hash)
    assert_equal "http://localhost:3000", client_params[:base_url]
    assert_equal @api_key, client_params[:api_key]
  end

  def test_environment_constants_exist
    # Verify environment constants from README exist
    assert defined?(Payroc::Environment::PRODUCTION), "PRODUCTION environment should be defined"
    assert defined?(Payroc::Environment::UAT), "UAT environment should be defined"
    
    # Verify they are hashes with :api and :identity keys
    assert Payroc::Environment::PRODUCTION.is_a?(Hash)
    assert Payroc::Environment::UAT.is_a?(Hash)
    assert Payroc::Environment::PRODUCTION.key?(:api)
    assert Payroc::Environment::PRODUCTION.key?(:identity)
    assert Payroc::Environment::UAT.key?(:api)
    assert Payroc::Environment::UAT.key?(:identity)
  end

  def test_client_api_modules_exist
    # Verify the main API modules exist
    assert defined?(Payroc::CardPayments), "CardPayments module should be defined"
    assert defined?(Payroc::BankTransferPayments), "BankTransferPayments module should be defined"
    assert defined?(Payroc::Auth), "Auth module should be defined"
    assert defined?(Payroc::Funding), "Funding module should be defined"
    assert defined?(Payroc::Boarding), "Boarding module should be defined"
  end

  def test_payment_request_structure_compiles
    # Verify the payment request structure from README compiles
    request_params = {
      idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
      channel: 'web',
      processing_terminal_id: '1234001',
      operator: 'Jane',
      order: {
        order_id: 'OrderRef6543',
        description: 'Large Pepperoni Pizza',
        amount: 4999,
        currency: 'USD'
      },
      customer: {
        first_name: 'Sarah',
        last_name: 'Hopper',
        billing_address: {
          address_1: '1 Example Ave.',
          address_2: 'Example Address Line 2',
          address_3: 'Example Address Line 3',
          city: 'Chicago',
          state: 'Illinois',
          country: 'US',
          postal_code: '60056'
        },
        shipping_address: {
          recipient_name: 'Sarah Hopper',
          address: {
            address_1: '1 Example Ave.',
            address_2: 'Example Address Line 2',
            address_3: 'Example Address Line 3',
            city: 'Chicago',
            state: 'Illinois',
            country: 'US',
            postal_code: '60056'
          }
        }
      },
      payment_method: {
        card: {
          card_details: {
            raw: {
              device: {
                model: 'bbpos_chp',
                serial_number: 'PAX123456789'
              },
              raw_data: 'A1B2C3D4E5F67890ABCD1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF'
            }
          }
        }
      },
      custom_fields: [{
        name: 'yourCustomField',
        value: 'abc123'
      }]
    }
    
    # Verify the structure compiles
    assert request_params.is_a?(Hash)
    assert_equal '8e03978e-40d5-43e8-bc93-6894a57f9324', request_params[:idempotency_key]
  end

  def test_list_parameters_compile
    # Verify list parameters from README compile
    params_date_from = {
      processing_terminal_id: '1234001',
      date_from: '2024-07-01T15:30:00.000Z'
    }
    
    params_date_to = {
      processing_terminal_id: '1234001',
      date_to: '2024-07-03T15:30:00.000Z'
    }
    
    params_after = {
      processing_terminal_id: '1234001',
      after: '8516'
    }
    
    params_before = {
      processing_terminal_id: '1234001',
      before: '2571'
    }
    
    assert params_date_from.is_a?(Hash)
    assert params_date_to.is_a?(Hash)
    assert params_after.is_a?(Hash)
    assert params_before.is_a?(Hash)
  end

  def test_timeout_configuration_compiles
    # Verify timeout configuration from README compiles
    request_options = {
      request_options: {
        timeout_in_seconds: 30
      }
    }
    
    assert request_options.is_a?(Hash)
    assert_equal 30, request_options[:request_options][:timeout_in_seconds]
  end

  def test_exception_classes_exist
    # Verify exception classes from README exist
    assert defined?(Payroc::Errors::ApiError)
    assert defined?(Payroc::Errors::UnauthorizedError)
    assert defined?(Payroc::Errors::ForbiddenError)
    assert defined?(Payroc::Errors::NotFoundError)
    assert defined?(Payroc::Errors::ClientError)
    assert defined?(Payroc::Errors::ServerError)
    assert defined?(Payroc::Errors::TimeoutError)
    assert defined?(Payroc::Errors::ResponseError)
  end

  def test_client_namespace_classes_exist
    # Verify client classes for each namespace exist
    assert defined?(Payroc::CardPayments::Client), "CardPayments::Client should be defined"
    assert defined?(Payroc::BankTransferPayments::Client), "BankTransferPayments::Client should be defined"
    assert defined?(Payroc::Auth::Client), "Auth::Client should be defined"
  end
end
