# frozen_string_literal: true

module Payroc
  module Payments
    module BankAccounts
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to verify a customer's bank account details.
        #
        # In the request, send the customer's bank account details. Our gateway can verify the following types of bank
        # details:
        # - Automated Clearing House (ACH) details
        # - Pre-Authorized Debit (PAD) details
        #
        # In the response, our gateway indicates if the account details are valid and if you should use them in
        # follow-on actions.
        #
        #
        # @param request_options [Hash]
        # @param params [Payroc::Payments::BankAccounts::Types::BankAccountVerificationRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::BankAccountVerificationResult]
        def verify(request_options: {}, **params)
          body_prop_names = %i[processing_terminal_id bank_account]
          body_bag = params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "bank-accounts/verify",
            body: Payroc::Payments::BankAccounts::Types::BankAccountVerificationRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::BankAccountVerificationResult.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
