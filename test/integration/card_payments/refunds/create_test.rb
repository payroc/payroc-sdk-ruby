# frozen_string_literal: true

require "test_helper"
require "payroc"
require "json"
require "securerandom"

module Integration
  module CardPayments
    module Refunds
      # Integration test for creating unreferenced refunds
      # Based on papi-sdk-dotnet CreateTests.cs
      class CreateTest < Minitest::Test
        def setup
          @api_key = ENV["PAYROC_API_KEY_PAYMENTS"]
          @terminal_id_avs = ENV["TERMINAL_ID_AVS"]
          
          skip "PAYROC_API_KEY_PAYMENTS environment variable not set" unless @api_key
          skip "TERMINAL_ID_AVS environment variable not set" unless @terminal_id_avs
          
          @client = Payroc::Client.new(
            environment: Payroc::Environment::UAT,
            api_key: @api_key
          )
        end

        def test_create_unreferenced_refund_smoke_test
          # Load test data from JSON file
          test_data = load_test_data("UnreferencedRefund.json")
          
          # Override with dynamic values
          test_data[:idempotency_key] = SecureRandom.uuid
          test_data[:processing_terminal_id] = @terminal_id_avs
          
          # Create the refund request
          card_payments_client = Payroc::CardPayments::Client.new(client: @client.instance_variable_get(:@raw_client))
          refunds_client = card_payments_client.refunds
          
          # Create unreferenced refund and verify response
          response = refunds_client.create_unreferenced_refund(**test_data)
          
          refute_nil response
          refute_nil response.transaction_result
          assert_equal "ready", response.transaction_result.status
        end

        private

        def load_test_data(filename)
          test_data_path = File.join(
            File.dirname(__FILE__),
            "..", "..", "..", "integration", "test_data",
            filename
          )
          
          unless File.exist?(test_data_path)
            raise "Test data file not found: #{test_data_path}"
          end
          
          json_content = File.read(test_data_path)
          parsed_data = JSON.parse(json_content, symbolize_names: true)
          
          # Convert nested hashes to use symbol keys recursively
          deep_symbolize_keys(parsed_data)
        end

        def deep_symbolize_keys(obj)
          case obj
          when Hash
            obj.each_with_object({}) do |(key, value), result|
              result[key.to_sym] = deep_symbolize_keys(value)
            end
          when Array
            obj.map { |item| deep_symbolize_keys(item) }
          else
            obj
          end
        end
      end
    end
  end
end
