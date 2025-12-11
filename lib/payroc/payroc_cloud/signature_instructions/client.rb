# frozen_string_literal: true

module Payroc
  module PayrocCloud
    module SignatureInstructions
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to submit an instruction to capture a customer's signature on a payment device.
        #
        # Our gateway returns information about the signature instruction and a signatureInstructionId, which you need
        # for the following methods:
        # - [Retrieve signature
        # instruction](https://docs.payroc.com/api/schema/payroc-cloud/signature-instructions/retrieve) - View the
        # details of the signature instruction.
        # - [Cancel signature
        # instruction](https://docs.payroc.com/api/schema/payroc-cloud/signature-instructions/delete) - Cancel the
        # signature instruction.
        #
        # @param request_options [Hash]
        # @param params [Payroc::PayrocCloud::SignatureInstructions::Types::SignatureInstructionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :serial_number
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::SignatureInstruction]
        def submit(request_options: {}, **params)
          path_param_names = %i[serial_number]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[processing_terminal_id]
          body_bag = body_params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "devices/#{params[:serial_number]}/signature-instructions",
            body: Payroc::PayrocCloud::SignatureInstructions::Types::SignatureInstructionRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::SignatureInstruction.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a signature instruction.
        #
        # To retrieve a signature instruction, you need its signatureInstructionId. Our gateway returned the
        # signatureInstructionId in the response of the [Submit Signature
        # Instruction](https://docs.payroc.com/api/schema/payroc-cloud/signature-instructions/submit) method.
        #
        # Our gateway returns the status of the instruction. If the payment device completed the instruction, the
        # response also includes a link to retrieve the signature.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :signature_instruction_id
        #
        # @return [Payroc::Types::SignatureInstruction]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "signature-instructions/#{params[:signature_instruction_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::SignatureInstruction.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to cancel a signature instruction.
        #
        # To cancel a signature instruction, you need its signatureInstructionId. Our gateway returned the
        # signatureInstructionId in the response of the [Submit signature
        # instruction](https://docs.payroc.com/api/schema/payroc-cloud/signature-instructions/submit) method.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :signature_instruction_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "DELETE",
            path: "signature-instructions/#{params[:signature_instruction_id]}",
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
