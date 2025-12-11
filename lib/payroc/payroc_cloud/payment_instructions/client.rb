# frozen_string_literal: true

module Payroc
  module PayrocCloud
    module PaymentInstructions
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to submit an instruction request to initiate a sale on a payment device.
        #
        # In the request, include the order amount and currency.
        #
        # When you send a successful request, our gateway returns information about the payment instruction and a
        # paymentInstructionId, which you need for the following methods:
        # - [Retrieve payment
        # instruction](https://docs.payroc.com/api/schema/payroc-cloud/payment-instructions/retrieve) - View the details
        # of the payment instruction.
        # - [Cancel payment instruction](https://docs.payroc.com/api/schema/payroc-cloud/payment-instructions/delete) -
        # Cancel the payment instruction.
        #
        # @param request_options [Hash]
        # @param params [Payroc::PayrocCloud::PaymentInstructions::Types::PaymentInstructionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :serial_number
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::PaymentInstruction]
        def submit(request_options: {}, **params)
          path_param_names = %i[serial_number]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[operator processing_terminal_id order customer ip_address credential_on_file customization_options auto_capture process_as_sale]
          body_bag = body_params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "devices/#{params[:serial_number]}/payment-instructions",
            body: Payroc::PayrocCloud::PaymentInstructions::Types::PaymentInstructionRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::PaymentInstruction.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a payment instruction.
        #
        # To retrieve a payment instruction, you need its paymentInstructionId. Our gateway returned the
        # paymentInstructionId in the response of the [Submit Payment
        # Instruction](https://docs.payroc.com/api/schema/payroc-cloud/payment-instructions/submit) method.
        #
        # Our gateway returns the status of the payment instruction. If the payment device completed the payment
        # instruction, the response also includes a link to the payment.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :payment_instruction_id
        #
        # @return [Payroc::Types::PaymentInstruction]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "payment-instructions/#{params[:payment_instruction_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::PaymentInstruction.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to cancel a payment instruction.
        #
        # You can cancel a payment instruction only if its status is `inProgress`. To retrieve the status of a payment
        # instruction, use our [Retrieve Payment
        # Instruction](https://docs.payroc.com/api/schema/payroc-cloud/payment-instructions/retrieve) method.
        #
        # To cancel a payment instruction, you need its paymentInstructionId. Our gateway returned the
        # paymentInstructionId in the response of the [Submit Payment
        # Instruction](https://docs.payroc.com/api/schema/payroc-cloud/payment-instructions/submit) method.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :payment_instruction_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "DELETE",
            path: "payment-instructions/#{params[:payment_instruction_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          return if code.between?(200, 299)

          error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
          raise error_class.new(response.body, code: code)
        end
      end
    end
  end
end
