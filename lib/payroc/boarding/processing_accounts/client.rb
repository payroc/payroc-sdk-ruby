# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to retrieve information about a specific processing account.
        #
        # To retrieve a processing account, you need its processingAccountId. Our gateway returned the
        # processingAccountId in the response of the [Create Merchant
        # Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method or the [Create
        # Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account)
        # method.
        #
        # **Note:** If you don't have the processingAccountId, use our [List Merchant Platform's Processing
        # Accounts](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list-processing-accounts) method to
        # search for the processing account.
        #
        # Our gateway returns the following information about the processing account:
        #
        # -	Business information, including the Merchant Category Code (MCC), status of the processing account, and
        # address of the business.
        # -	Processing information, including the merchant’s refund policies and card types that the merchant accepts.
        # -	Funding information, including funding schedules, funding fees, and details for the merchant’s funding
        # accounts.
        # -	Pricing information, including
        # [HATEOAS](https://docs.payroc.com/knowledge/basic-concepts/hypermedia-as-the-engine-of-application-state-hateoas)
        # links to retrieve the pricing program for the processing account.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_account_id
        #
        # @return [Payroc::Types::ProcessingAccount]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-accounts/#{params[:processing_account_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::ProcessingAccount.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Retrieve a list of funding accounts associated with a processing account.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_account_id
        #
        # @return [Array[Payroc::Types::FundingAccount]]
        def list_processing_account_funding_accounts(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-accounts/#{params[:processing_account_id]}/funding-accounts",
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

        # Use this method to return a list of contacts for a processing account.
        #
        # **Note:** If you want to view the details of a specific contact and you have their contactId, use our
        # [Retrieve Contact](https://docs.payroc.com/api/schema/boarding/contacts/retrieve) method.
        #
        # To list contacts for a processing account, you need the processingAccountId. Our gateway returned the
        # processingAccountId in the response of the [Create Merchant
        # Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method or the [Create
        # Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account)
        # method.
        #
        # Our gateway returns the following information about each contact:
        #
        # - Name and contact method, including their phone number or mobile number.
        # - Role within the business, for example, if they are a manager.
        #
        # For each contact, we also return a contactId, which you can use to perform follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_account_id
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        #
        # @return [Payroc::Types::PaginatedContacts]
        def list_contacts(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[before after limit]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params = params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-accounts/#{params[:processing_account_id]}/contacts",
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
            Payroc::Types::PaginatedContacts.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve the pricing agreement that we apply to a processing account.
        #
        # To retrieve the pricing agreement of a processing account, you need the processingAccountId. Our gateway
        # returned the processingAccountId in the response to the [Create Merchant
        # Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method and [Create Processing
        # Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.
        #
        # **Note:** If you don't have the processingAccountId, use our [List Merchant Platform’s Processing
        # Accounts](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list-processing-accounts) method to
        # search for the processing account.
        #
        # Our gateway returns the following information about the pricing agreement that we apply to the processing
        # account:
        #
        # - Base fees, including the annual fee and the fees for each chargeback and retrieval.
        # - Processor fees, including the fees that we apply for processing card and ACH payments.
        # - Gateway fees, including the setup fee and the fees for each transaction.
        # - Service fees, including the fee that we apply if the merchant has signed up to a Hardware Advantage Plan.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_account_id
        #
        # @return [Payroc::Boarding::ProcessingAccounts::Types::GetProcessingAccountPricingAgreementProcessingAccountsResponse]
        def get_processing_account_pricing_agreement(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-accounts/#{params[:processing_account_id]}/pricing",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Boarding::ProcessingAccounts::Types::GetProcessingAccountPricingAgreementProcessingAccountsResponse.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to return a list of owners of a processing account.
        #
        # **Note:** If you want to view the details of a specific owner and you have the ownerId, go to our [Retrieve
        # Owner](https://docs.payroc.com/api/schema/boarding/owners/retrieve) method.
        #
        # To list the owners of a processing account, you need its processingAccountId. If you don't have the
        # processingAccountId, use our [List Merchant Platform's Processing
        # Accounts](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list-processing-accounts) method to
        # search for the processing account.
        #
        # Our gateway returns the following information about each owner in the list:
        #
        # - Name, date of birth, and address.
        # - Contact details, including their email address.
        # - Relationship to the business, including whether they are a control prong or authorized signatory, and their
        # equity stake in the business.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_account_id
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        #
        # @return [Payroc::Types::PaginatedOwners]
        def list_owners(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[before after limit]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params = params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-accounts/#{params[:processing_account_id]}/owners",
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
            parsed_response = Payroc::Types::PaginatedOwners.load(response.body)
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

        # Use this method to prompt a merchant to sign their pricing agreement.
        #
        # You can create a reminder only if you requested the merchant’s signature by email when you created the
        # processing account for the merchant.
        #
        # To create a reminder, you need the processingAccountId. Our gateway returned the processingAccountId in the
        # response of the [Create Merchant
        # Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create) method or [Create Processing
        # Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.
        #
        # **Note:** If you don’t know the processingAccountId, use our [List Merchant Platform’s Processing
        # Accounts](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list-processing-accounts) method to
        # search for the processing account.
        #
        # When you send a successful request, we send an email to the merchant that prompts them to sign their pricing
        # agreement.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Boarding::ProcessingAccounts::Types::CreateReminderProcessingAccountsRequestBody]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_account_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Boarding::ProcessingAccounts::Types::CreateReminderProcessingAccountsResponse]
        def create_reminder(request_options: {}, **params)
          path_param_names = %i[processing_account_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "processing-accounts/#{params[:processing_account_id]}/reminders",
            body: Payroc::Boarding::ProcessingAccounts::Types::CreateReminderProcessingAccountsRequestBody.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Boarding::ProcessingAccounts::Types::CreateReminderProcessingAccountsResponse.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of terminal orders
        # associated with a processing account.
        #
        # **Note:** If you want to view the details of a specific terminal order and you have its terminalOrderId, use
        # our [Retrieve Terminal Order](https://docs.payroc.com/api/schema/boarding/terminal-orders/retrieve) method.
        #
        # Use the query parameters to filter the list of results that we return, for example, to search for terminal
        # orders by their status.
        #
        # To list the terminal orders for a processing account, you need its processingAccountId. If you don't have the
        # processingAccountId, use our [List Merchant
        # Platforms](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list) method to search for a
        # merchant platform and its processing accounts.
        #
        # Our gateway returns the following information for each terminal order in the list:
        #
        # - Status of the order
        # - Items in the order
        # - Training provider
        # - Shipping information
        #
        # For each terminal order, we also return its terminalOrderId, which you can use to perform follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_account_id
        # @option params [Payroc::Boarding::ProcessingAccounts::Types::ListTerminalOrdersProcessingAccountsRequestStatus, nil] :status
        # @option params [String, nil] :from_date_time
        # @option params [String, nil] :to_date_time
        #
        # @return [Array[Payroc::Types::TerminalOrder]]
        def list_terminal_orders(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[status from_date_time to_date_time]
          query_params = {}
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["fromDateTime"] = params[:from_date_time] if params.key?(:from_date_time)
          query_params["toDateTime"] = params[:to_date_time] if params.key?(:to_date_time)
          params = params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-accounts/#{params[:processing_account_id]}/terminal-orders",
            query: query_params,
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

        # Use this method to order and configure terminals for a processing account.
        #
        # **Note**: You need the ID of the processing account before you can create an order. If you don't know the
        # processingAccountId, go to the [Retrieve a Merchant
        # Platform](https://docs.payroc.com/api/schema/boarding/merchant-platforms/retrieve) method.
        #
        # In the request, specify the gateway settings, device settings, and application settings for the terminal.
        #
        # In the response, our gateway returns information about the terminal order including its status and
        # terminalOrderId that you can use to [retrieve the terminal
        # order](https://docs.payroc.com/api/schema/boarding/terminal-orders/retrieve).
        #
        # **Note**: You can subscribe to the terminalOrder.status.changed event to get notifications when we update the
        # status of a terminal order. For more information about how to subscribe to events, go to [Events
        # Subscriptions](https://docs.payroc.com/guides/integrate/event-subscriptions).
        #
        # @param request_options [Hash]
        # @param params [Payroc::Boarding::ProcessingAccounts::Types::CreateTerminalOrder]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_account_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::TerminalOrder]
        def create_terminal_order(request_options: {}, **params)
          path_param_names = %i[processing_account_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[training_provider shipping order_items]
          body_bag = body_params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "processing-accounts/#{params[:processing_account_id]}/terminal-orders",
            body: Payroc::Boarding::ProcessingAccounts::Types::CreateTerminalOrder.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::TerminalOrder.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of processing terminals
        # associated with a processing account.
        #
        # **Note:** If you want to view the details of a specific processing terminal and you have its
        # processingTerminalId, use our [Retrieve Processing
        # Terminal](https://docs.payroc.com/api/schema/boarding/processing-terminals/retrieve) method.
        #
        # To list the terminals for a processing account, you need its processingAccountId. If you don't have the
        # processingAccountId, use our [List Merchant
        # Platforms](https://docs.payroc.com/api/schema/boarding/merchant-platforms/list) method to search for a
        # merchant platform and its processing accounts.
        #
        # Our gateway returns the following information for each processing terminal in the list:
        #
        # - Status indicating whether the terminal is active or inactive.
        # - Configuration settings, including gateway settings and application settings.
        # - Features, receipt settings, and security settings.
        # - Devices that use the processing terminal's configuration.
        #
        # For each processing terminal, we also return its processingTerminalId, which you can use to perform follow-on
        # actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_account_id
        # @option params [String, nil] :before
        # @option params [String, nil] :after
        # @option params [Integer, nil] :limit
        #
        # @return [Payroc::Types::PaginatedProcessingTerminals]
        def list_processing_terminals(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.symbolize_keys(params)
          query_param_names = %i[before after limit]
          query_params = {}
          query_params["before"] = params[:before] if params.key?(:before)
          query_params["after"] = params[:after] if params.key?(:after)
          query_params["limit"] = params[:limit] if params.key?(:limit)
          params = params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-accounts/#{params[:processing_account_id]}/processing-terminals",
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
            parsed_response = Payroc::Types::PaginatedProcessingTerminals.load(response.body)
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
