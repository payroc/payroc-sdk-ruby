# frozen_string_literal: true

module Payroc
  module Funding
    module FundingInstructions
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

        # > Important: You can return a list of funding instructions from only the previous two years. If you want to
        # view a funding instruction from more than two years ago and you have its instructionId, use our [Retrieve
        # Funding Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/retrieve) method.
        #
        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of funding instructions
        # within a specific date range.
        #
        # **Note:** If you want to view the details of a specific funding instruction and you have its instructionId,
        # use our [Retrieve Funding
        # Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/retrieve) method.
        #
        # Our gateway returns the following information for each instruction in the list:
        # -	Status of the funding instruction.
        # -	Funding information, including which merchant's funding balance we distribute and the funding account that
        # we send the balance to.
        #
        # For each funding instruction, we also return the instructionId, which you can use to perform follow-on
        # actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        # @option params [String] :date_from
        # @option params [String] :date_to
        #
        # @return [Payroc::Funding::FundingInstructions::Types::ListFundingInstructionsResponse]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[before after limit date_from date_to]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["dateFrom"] = params[:date_from] if params.key?(:date_from)
          query_params["dateTo"] = params[:date_to] if params.key?(:date_to)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "funding-instructions",
            query: query_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            parsed_response = Payroc::Funding::FundingInstructions::Types::ListFundingInstructionsResponse.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end

          Payroc::Internal::PayrocPager.new(
            parsed_response,
            item_field: :data,
            raw_client: @client
          )
        end

        # Use this method to create a funding instruction that tells us how to distribute the funds from your merchants'
        # transactions.
        #
        # **Note:** Before you create a funding instruction, you can use our [List Funding
        # Balances](https://docs.payroc.com/api/schema/funding/funding-activity/retrieve-balance) method to view the
        # amount of available funds that a merchant has.
        #
        # In your request, include an array of merchantInstruction objects. Each merchantInstruction object contains the
        # following:
        # -	Merchant ID (MID) of the merchant whose funding balance you want to distribute.
        # -	Funding account that you want to send funds to.
        # -	Amount that you want to send to the funding account.
        #
        # Our gateway returns the instructionId, which you can use to run follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::Instruction]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::Instruction]
        def create(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "funding-instructions",
            headers: headers,
            body: Payroc::Types::Instruction.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Instruction.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a funding instruction.
        #
        # To retrieve a funding instruction, you need its instructionId. Our gateway returned the instructionId in the
        # response of the [Create Funding
        # Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/create) method.
        #
        # **Note:** If you don't have the instructionId, use our [List Funding
        # Instructions](https://docs.payroc.com/api/schema/funding/funding-instructions/list) method to search for the
        # funding instruction.
        #
        # Our gateway returns the following information about the funding instruction:
        # -	Status of the funding instruction.
        # -	Funding information, including which merchant's funding balance we distribute and the funding account that
        # we send the balance to.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :instruction_id
        #
        # @return [Payroc::Types::Instruction]
        def retrieve(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "funding-instructions/#{params[:instruction_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Instruction.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # > **Important:** You can update a funding instruction only if its status is `accepted`. To view the status of
        # a funding instruction, use our [Retrieve Funding
        # Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/retrieve) method.
        #
        # Use this method to update the details of a funding instruction.
        #
        # To update a funding instruction, you need its instructionId. Our gateway returned the instructionId in the
        # response of the [Create Funding
        # Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/create) method.
        #
        # **Note:** If you don't have the fundingInstructionId, use our [List Funding
        # Instructions](https://docs.payroc.com/api/schema/funding/funding-instructions/list) method to search for the
        # funding instruction.
        #
        # You can modify the following information for the funding instruction:
        # -	Merchant ID (MID) of the merchant whose funding balance you want to distribute.
        # -	Funding account that you want to send funds to.
        # -	Amount that you want to send to the funding account.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::Instruction]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :instruction_id
        #
        # @return [untyped]
        def update(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[instruction_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "PUT",
            path: "funding-instructions/#{params[:instruction_id]}",
            body: Payroc::Types::Instruction.new(body_params).to_h,
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

        # > **Important:** You can delete a funding instruction only if its status is `accepted`. To view the status of
        # a funding instruction, use our [Retrieve Funding
        # Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/retrieve) method.
        #
        # Use this method to delete a funding instruction.
        #
        # To delete a funding instruction, you need its instructionId. Our gateway returned the instructionId in the
        # response of the [Create Funding
        # Instruction](https://docs.payroc.com/api/schema/funding/funding-instructions/create) method.
        #
        # **Note:** If you don't have the instructionId, use our [List Funding
        # Instructions](https://docs.payroc.com/api/schema/funding/funding-instructions/list) method to search for the
        # funding instruction.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :instruction_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "DELETE",
            path: "funding-instructions/#{params[:instruction_id]}",
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
