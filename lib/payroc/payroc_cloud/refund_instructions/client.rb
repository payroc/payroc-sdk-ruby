# frozen_string_literal: true

module Payroc
  module PayrocCloud
    module RefundInstructions
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        # @param base_url [String, nil]
        # @param environment [Hash[Symbol, String], nil]
        #
        # @return [void]
        def initialize(client:, base_url: nil, environment: nil)
          @client = client
          @base_url = base_url
          @environment = environment
        end

        # Use this method to submit an instruction request to initiate a refund on a payment device.
        #
        # In the request, include the refund amount and currency.
        #
        # If the request is successful, our gateway returns information about the refund instruction and a
        # refundInstructionId, which you need for the following methods:
        # - [Retrieve refund instruction](https://docs.payroc.com/api/schema/payroc-cloud/refund-instructions/retrieve)
        # - View the details of the refund instruction.
        # - [Cancel refund instruction](https://docs.payroc.com/api/schema/payroc-cloud/refund-instructions/delete) -
        # Cancel the refund instruction.
        #
        # @param request_options [Hash]
        # @param params [Payroc::PayrocCloud::RefundInstructions::Types::RefundInstructionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :serial_number
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::RefundInstruction]
        def submit(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[serial_number]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[operator processing_terminal_id order customer ip_address customization_options]
          body_bag = body_params.slice(*body_prop_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "devices/#{params[:serial_number]}/refund-instructions",
            headers: headers,
            body: Payroc::PayrocCloud::RefundInstructions::Types::RefundInstructionRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::RefundInstruction.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a refund instruction.
        #
        # To retrieve a refund instruction, you need its refundInstructionId. Our gateway returned the
        # refundInstructionId in the response of the [Submit Refund
        # Instruction](https://docs.payroc.com/api/schema/payroc-cloud/refund-instructions/submit) method.
        #
        # Our gateway returns the status of the refund instruction. If the payment device completed the refund
        # instruction, the response also includes a link to the refund.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :refund_instruction_id
        #
        # @return [Payroc::Types::RefundInstruction]
        def retrieve(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "refund-instructions/#{params[:refund_instruction_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::RefundInstruction.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to cancel a refund instruction.
        #
        # You can cancel a refund instruction only if its status is `inProgress`. To retrieve the status of a refund
        # instruction, use our [Retrieve Refund
        # Instruction](https://docs.payroc.com/api/schema/payroc-cloud/refund-instructions/retrieve) method.
        #
        # To cancel a refund instruction, you need its refundInstructionId. Our gateway returned the refundInstructionId
        # in the response of the [Submit Refund
        # Instruction](https://docs.payroc.com/api/schema/payroc-cloud/refund-instructions/submit) method.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :refund_instruction_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "DELETE",
            path: "refund-instructions/#{params[:refund_instruction_id]}",
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
