# frozen_string_literal: true

module Payroc
  module Funding
    module FundingAccounts
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of funding accounts
        # associated with your account.
        #
        # **Note:** If you want to view the details of a specific funding account and you have its fundingAccountId, use
        # our [Retrieve Funding Account](https://docs.payroc.com/api/schema/funding/funding-accounts/retrieve) method.
        #
        # Our gateway returns the following information about each funding account in the list:
        # - Name of the account holder and ACH details for the account.
        # - Status of the account.
        # - Whether we send funds to the account, withdraw funds from the account, or both.
        #
        # For each funding account, we also return the fundingAccountId, which you can use to perform follow-on actions.
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
        #
        # @return [Payroc::Types::ListFundingAccounts]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[before after limit]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "funding-accounts",
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
            parsed_response = Payroc::Types::ListFundingAccounts.load(response.body)
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

        # Use this method to retrieve information about a funding account.
        #
        # To retrieve a funding account, you need its fundingAccountId. Our gateway returned the fundingAccountId when
        # you created the funding account.
        #
        # **Note:** If you don't have the fundingAccountId, use our [List Funding
        # Accounts](https://docs.payroc.com/api/schema/funding/funding-accounts/list) method to search for the account.
        #
        # Our gateway returns the following information about the funding account:
        # - Name of the account holder and ACH details for the account.
        # - Status of the account.
        # - Whether we send funds to the account, withdraw funds from the account, or both.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :funding_account_id
        #
        # @return [Payroc::Types::FundingAccount]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "funding-accounts/#{params[:funding_account_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::FundingAccount.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # > **Important:** You can't update the details of a funding account that is associated with a processing
        # account.
        #
        # Use this method to update the details of a funding account that is associated with a funding recipient.
        #
        # To update a funding account, you need its fundingAccountId. Our gateway returned the fundingAccountId when you
        # created the funding account.
        #
        # **Note:** If you don’t have the fundingAccountId, use our [List Funding
        # Accounts](https://docs.payroc.com/api/schema/funding/funding-accounts/list) method to search for the funding
        # account.
        #
        # You can update the following details about the funding account:
        # -	Account type.
        # -	Account holder's name.
        # -	ACH information for the account.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::FundingAccount]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :funding_account_id
        #
        # @return [untyped]
        def update(request_options: {}, **params)
          path_param_names = %i[funding_account_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "PUT",
            path: "funding-accounts/#{params[:funding_account_id]}",
            body: Payroc::Types::FundingAccount.new(body_params).to_h,
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

        # > **Important:** You can't delete a funding account that is associated with a processing account.
        #
        # Use this method to delete a funding account that is associated with a funding recipient.
        #
        # To delete a funding account, you need its fundingAccountId. Our gateway returned the fundingAccountId when you
        # created the funding account.
        #
        # **Note:** If you don't have the fundingAccountId, use our [List Funding
        # Accounts](https://docs.payroc.com/api/schema/funding/funding-accounts/list) method to search for the funding
        # account.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :funding_account_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "DELETE",
            path: "funding-accounts/#{params[:funding_account_id]}",
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
