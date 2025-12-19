# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
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

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of batches that your
        # merchants submitted to the processor on a specific date.
        #
        # **Note:** If you want to view the details of a specific batch and you have its batchId, use our [Retrieve
        # Batch](https://docs.payroc.com/api/schema/reporting/settlement/retrieve-batch) method.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for batches that
        # were submitted by a specific merchant.
        #
        # > **Important:** You must provide a value for the date query parameter.
        #
        # Our gateway returns the following information about each batch in the list:
        # -	Transaction information, including the number of transactions and total value of sales.
        # -	Merchant information, including the merchant ID (MID) and the processing account that the batch is
        # associated with.
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
        # @option params [String] :date
        # @option params [String, nil] :merchant_id
        #
        # @return [Payroc::Reporting::Settlement::Types::ListBatchesSettlementResponse]
        def list_batches(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[before after limit date merchant_id]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["date"] = params[:date] if params.key?(:date)
          query_params["merchantId"] = params[:merchant_id] if params.key?(:merchant_id)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "batches",
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
            parsed_response = Payroc::Reporting::Settlement::Types::ListBatchesSettlementResponse.load(response.body)
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

        # Use this method to retrieve information about a batch.
        #
        # **Note:** To retrieve a batch, you need its batchId. If you don't have the batchId, use our [List
        # Batches](https://docs.payroc.com/api/schema/reporting/settlement/list-batches) method to search for the batch.
        #
        # Our gateway returns the following information about the batch:
        #
        # -	Transaction information, including the number of transactions and total value of sales.
        # -	Merchant information, including the merchant ID (MID) and the processing account that the batch is
        # associated with.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :batch_id
        #
        # @return [Payroc::Types::Batch]
        def retrieve_batch(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "batches/#{params[:batch_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Batch.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to return a paginated list of your merchants’ transactions.
        #
        # **Note:** If you want to view the details of a specific transaction and you have its transactionId, use our
        # [Retrieve Transaction](https://docs.payroc.com/api/schema/reporting/settlement/retrieve-transaction) method.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for transactions for
        # a specific merchant.
        #
        # > **Important:** You must provide a value for either the date query parameter or the batchId query parameter.
        #
        # Our gateway returns the following information about each transaction in the list:
        #
        # -	Merchant and processing account that ran the transaction.
        # -	Transaction type, date, amount, and the payment method that the customer used.
        # -	Batch that contains the transaction, and authorization details for the transaction.
        # -	Processor that settled the transaction and the ACH deposit containing the transaction.
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
        # @option params [String, nil] :date
        # @option params [Integer, nil] :batch_id
        # @option params [String, nil] :merchant_id
        # @option params [Payroc::Reporting::Settlement::Types::ListTransactionsSettlementRequestTransactionType, nil] :transaction_type
        #
        # @return [Payroc::Reporting::Settlement::Types::ListTransactionsSettlementResponse]
        def list_transactions(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[before after limit date batch_id merchant_id transaction_type]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["date"] = params[:date] if params.key?(:date)
          query_params["batchId"] = params[:batch_id] if params.key?(:batch_id)
          query_params["merchantId"] = params[:merchant_id] if params.key?(:merchant_id)
          query_params["transactionType"] = params[:transaction_type] if params.key?(:transaction_type)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "transactions",
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
            parsed_response = Payroc::Reporting::Settlement::Types::ListTransactionsSettlementResponse.load(response.body)
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

        # Use this method to retrieve information about a transaction.
        #
        # **Note:** To retrieve a transaction, you need its transactionId. If you don't have the transactionId, use our
        # [List Transactions](https://docs.payroc.com/api/schema/reporting/settlement/list-transactions) method to
        # search for the transaction.
        #
        # Our gateway returns the following information about the transaction:
        #
        # -	Merchant and processing account that ran the transaction.
        # -	Transaction type, date, amount, and the payment method that the customer used.
        # -	Batch that contains the transaction, and authorization details for the transaction.
        # -	Processor that settled the transaction and the ACH deposit containing the transaction.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :transaction_id
        #
        # @return [Payroc::Types::Transaction]
        def retrieve_transaction(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "transactions/#{params[:transaction_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Transaction.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve a [paginated](https://docs.payroc.com/api/pagination) list of authorizations.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for authorizations
        # linked to a specific merchant.
        #
        # > **Important:** You must provide a value for either the date query parameter or the batchId query parameter.
        #
        # Our gateway returns the following information about each authorization in the list:
        # - Authorization response from the issuing bank.
        # - Amount that the issuing bank authorized.
        # - Merchant that ran the authorization.
        # - Details about the customer's card, the transaction, and the batch.
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
        # @option params [String, nil] :date
        # @option params [Integer, nil] :batch_id
        # @option params [String, nil] :merchant_id
        #
        # @return [Payroc::Reporting::Settlement::Types::ListAuthorizationsSettlementResponse]
        def list_authorizations(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[before after limit date batch_id merchant_id]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["date"] = params[:date] if params.key?(:date)
          query_params["batchId"] = params[:batch_id] if params.key?(:batch_id)
          query_params["merchantId"] = params[:merchant_id] if params.key?(:merchant_id)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "authorizations",
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
            parsed_response = Payroc::Reporting::Settlement::Types::ListAuthorizationsSettlementResponse.load(response.body)
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

        # Use this method to retrieve information about an authorization.
        #
        # **Note:** To retrieve an authorization, you need its authorizationId. If you don't have the authorizationId,
        # use our [List Authorizations](https://docs.payroc.com/api/schema/reporting/settlement/list-authorizations)
        # method to search for the authorization.
        #
        # Our gateway returns the following information about the authorization:
        # - Authorization response from the issuing bank.
        # - Amount that the issuing bank authorized.
        # - Merchant that ran the authorization.
        # - Details about the customer's card, the transaction, and the batch.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :authorization_id
        #
        # @return [Payroc::Types::Authorization]
        def retrieve_authorization(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "authorizations/#{params[:authorization_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Authorization.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of disputes.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for disputes linked
        # to a specific merchant.
        #
        # > **Important:** You must provide a value for the date query parameter.
        #
        # Our gateway returns the following information about each dispute in the list:
        # - Its status, type, and description.
        # - Transaction that the dispute is linked to, including the transaction date, merchant who ran the transaction,
        # and the payment method that the cardholder used.
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
        # @option params [String] :date
        # @option params [String, nil] :merchant_id
        #
        # @return [Payroc::Reporting::Settlement::Types::ListDisputesSettlementResponse]
        def list_disputes(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[before after limit date merchant_id]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["date"] = params[:date] if params.key?(:date)
          query_params["merchantId"] = params[:merchant_id] if params.key?(:merchant_id)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "disputes",
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
            parsed_response = Payroc::Reporting::Settlement::Types::ListDisputesSettlementResponse.load(response.body)
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

        # Use this method to return the status history of a dispute.
        #
        # To view the status history of a dispute, you need its disputeId. If you don't have the disputeId, use our
        # [List Disputes](https://docs.payroc.com/api/schema/reporting/settlement/list-disputes) method to search for
        # the dispute.
        #
        # Our gateway returns a list that contains each status change, the date it was changed, and its updated status.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :dispute_id
        #
        # @return [Array[Payroc::Types::DisputeStatus]]
        def list_disputes_statuses(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "disputes/#{params[:dispute_id]}/statuses",
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

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of ACH deposits that we
        # paid to your merchants.
        #
        # **Note:** If you want to view the details of a specific ACH deposit and you have its achDepositId, use our
        # [Retrieve ACH Deposit](https://docs.payroc.com/api/schema/reporting/settlement/retrieve-ach-deposit) method.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for ACH deposits
        # that we paid to a specific merchant.
        #
        # > **Important:** You must provide a value for the date query parameter.
        #
        # Our gateway returns the following information about each ACH deposit in the list:
        # - Merchant that we sent the ACH deposit to.
        # - Total amount that we paid the merchant.
        # - Breakdown of sales, returns, and fees.
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
        # @option params [String] :date
        # @option params [String, nil] :merchant_id
        #
        # @return [Payroc::Reporting::Settlement::Types::ListAchDepositsSettlementResponse]
        def list_ach_deposits(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[before after limit date merchant_id]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["date"] = params[:date] if params.key?(:date)
          query_params["merchantId"] = params[:merchant_id] if params.key?(:merchant_id)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "ach-deposits",
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
            parsed_response = Payroc::Reporting::Settlement::Types::ListAchDepositsSettlementResponse.load(response.body)
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

        # Use this method to retrieve information about an ACH deposit that we paid to a merchant.
        #
        # **Note:** To retrieve an ACH deposit, you need its achDepositId. If you don't have the achDepositId, use our
        # [List ACH Deposits](https://docs.payroc.com/api/schema/reporting/settlement/list-ach-deposits) method to
        # search for the ACH deposit.
        #
        # Our gateway returns the following information about the ACH deposit:
        #
        # - Merchant that we sent the ACH deposit to.
        # - Total amount that we paid the merchant.
        # - Breakdown of sales, returns, and fees.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :ach_deposit_id
        #
        # @return [Payroc::Types::AchDeposit]
        def retrieve_ach_deposit(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "ach-deposits/#{params[:ach_deposit_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::AchDeposit.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve a list of ACH deposit fees.
        #
        # > **Important:** You must provide a value for either the 'date' query parameter or the 'achDepositId' query
        # parameter.
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
        # @option params [String, nil] :date
        # @option params [Integer, nil] :ach_deposit_id
        # @option params [String, nil] :merchant_id
        #
        # @return [Payroc::Reporting::Settlement::Types::ListAchDepositFeesSettlementResponse]
        def list_ach_deposit_fees(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[before after limit date ach_deposit_id merchant_id]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          query_params["date"] = params[:date] if params.key?(:date)
          query_params["achDepositId"] = params[:ach_deposit_id] if params.key?(:ach_deposit_id)
          query_params["merchantId"] = params[:merchant_id] if params.key?(:merchant_id)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "ach-deposit-fees",
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
            parsed_response = Payroc::Reporting::Settlement::Types::ListAchDepositFeesSettlementResponse.load(response.body)
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
