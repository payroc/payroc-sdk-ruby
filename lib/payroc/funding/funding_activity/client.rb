# frozen_string_literal: true

module Payroc
  module Funding
    module FundingActivity
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of funding balances
        # available for each merchant linked to your account.
        #
        # Use query parameters to filter the list of results we return, for example, to search for the funding balance
        # for a specific merchant.
        #
        # Our gateway returns the following information about each merchant in the list:
        # - Total funds for the merchant.
        # - Available funds that you can use for funding instructions.
        # - Pending funds that we have not yet sent to funding accounts.
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
        # @option params [String, nil] :merchant_id
        #
        # @return [Payroc::Funding::FundingActivity::Types::RetrieveBalanceFundingActivityResponse]
        def retrieve_balance(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[before after limit merchant_id]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["merchantId"] = params[:merchant_id] if params.key?(:merchant_id)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "funding-balance",
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
            Payroc::Funding::FundingActivity::Types::RetrieveBalanceFundingActivityResponse.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of activity associated
        # with your merchants' funding balances within a specific date range.
        #
        # Use query parameters to filter the list of results we return, for example, to view the activity for a specific
        # merchant's funding balance.
        #
        # Our gateway returns the following information about each activity in the list:
        # - Name of the merchant who owns the funding balance.
        # -	Amount of funds added or removed from the funding balance.
        # -	Funding account that received funds from the funding balance.
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
        # @option params [String, nil] :merchant_id
        #
        # @return [Payroc::Funding::FundingActivity::Types::ListFundingActivityResponse]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[before after limit date_from date_to merchant_id]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["dateFrom"] = params[:date_from] if params.key?(:date_from)
          query_params["dateTo"] = params[:date_to] if params.key?(:date_to)
          query_params["merchantId"] = params[:merchant_id] if params.key?(:merchant_id)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "funding-activity",
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
            parsed_response = Payroc::Funding::FundingActivity::Types::ListFundingActivityResponse.load(response.body)
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
      end
    end
  end
end
