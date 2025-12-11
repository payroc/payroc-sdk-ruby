# frozen_string_literal: true

module Payroc
  module Funding
    module FundingRecipients
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of funding recipients
        # linked to your account.
        #
        # Note: If you want to view the details of a specific funding recipient and you have its recipientId, use our
        # [Retrieve Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/retrieve) method.
        #
        # Our gateway returns the following information about each funding recipient in the list:
        # - Tax ID and Doing Business As (DBA) name.
        # - Address and contact details.
        # - Funding accounts linked to the funding recipient.
        #
        # For each funding recipient, we also return the recipientId, which you can use to perform follow-on actions.
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
        # @return [Payroc::Types::PaginatedFundRecipients]
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
            path: "funding-recipients",
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
            parsed_response = Payroc::Types::PaginatedFundRecipients.load(response.body)
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

        # Use this method to create a funding recipient.
        #
        # A funding recipient is a business or organization that can receive funds but can't run transactions, for
        # example, a charity.
        #
        # In the request, include the following information:
        # -	Legal information, including its tax ID, Doing Business As (DBA) name, and address.
        # -	Contact information, including the email address.
        # -	Owners' details, including their contact details.
        # -	Funding account details.
        #
        # Our gateway returns the recipientId of the funding recipient, which you can use to run follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Funding::FundingRecipients::Types::CreateFundingRecipient]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::FundingRecipient]
        def create(request_options: {}, **params)
          body_prop_names = %i[recipient_type tax_id charity_id doing_business_as address contact_methods metadata owners funding_accounts]
          body_bag = params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "funding-recipients",
            body: Payroc::Funding::FundingRecipients::Types::CreateFundingRecipient.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::FundingRecipient.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve information about a funding recipient.
        #
        # To retrieve a funding recipient, you need its recipientId. Our gateway returned the recipientId in the
        # response of the [Create Funding
        # Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method.
        #
        # **Note:** If you don't have the recipientId, use our [List Funding
        # Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the
        # funding recipient.
        #
        # Our gateway returns the following information about the funding recipient:
        #
        # - Tax ID and Doing Business As (DBA) name.
        # - Address and contact details.
        # - Funding accounts linked to the funding recipient.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :recipient_id
        #
        # @return [Payroc::Types::FundingRecipient]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "funding-recipients/#{params[:recipient_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::FundingRecipient.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to update the details of a funding recipient. If a request contains significant changes, we
        # might need to re-approve the funding recipient.
        #
        # To update a funding recipient, you need it's recipientId. Our gateway returned the recipientId in the response
        # of the [Create Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create)
        # method.
        #
        # **Note**: If you don't have the recipientId, use our [List Funding
        # Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the
        # funding recipient.
        #
        # You can update the following details of a funding recipient:
        # - Doing Business As (DBA) name
        # - Tax ID and charity ID
        # - Address and contact methods
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::FundingRecipient]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :recipient_id
        #
        # @return [untyped]
        def update(request_options: {}, **params)
          path_param_names = %i[recipient_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "PUT",
            path: "funding-recipients/#{params[:recipient_id]}",
            body: Payroc::Types::FundingRecipient.new(body_params).to_h,
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

        # Use this method to delete a funding recipient, including its funding accounts and owners.
        #
        # To delete a funding recipient, you need its recipientId. Our gateway returned the recipientId in the response
        # of the [Create Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create)
        # method.
        #
        # **Note**: If you don't have the recipientId, use our [List Funding
        # Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the
        # funding recipient.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :recipient_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "DELETE",
            path: "funding-recipients/#{params[:recipient_id]}",
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

        # Use  this method to return a list of funding accounts associated with a funding recipient.
        #
        # **Note:** If you want to view the details of a specific funding account and you have its fundingAccountId, use
        # our [Retrieve Funding Account](https://docs.payroc.com/api/schema/funding/funding-accounts/retrieve) method.
        #
        # To retrieve the funding accounts associated with a funding recipient, you need the recipientId. If you don't
        # have the recipientId, use our [List Funding
        # Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the
        # funding recipient.
        #
        # Our gateway returns the following information about each funding account:
        # -	Name of the account holder.
        # -	ACH details for the account.
        # -	Status of the account.
        #
        # Our gateway also returns the fundingAccountId, which you can use to run follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :recipient_id
        #
        # @return [Array[Payroc::Types::FundingAccount]]
        def list_accounts(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "funding-recipients/#{params[:recipient_id]}/funding-accounts",
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

        # Use this method to create a funding account and add it to a funding recipient.
        #
        # To add a funding account to a funding recipient, you need the recipientId. Our gateway returned the
        # recipientId in the response of the [Create Funding
        # Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method.
        #
        # **Note:** If you don't have the recipientId, use our [List Funding
        # Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the
        # funding recipient.
        #
        # In the request, include the following information:
        # -	Account type, for example, if the account is a checking or savings account.
        # -	Account holder's name.
        # -	ACH information, including the routing number and account number of the account.
        #
        # Our gateway returns the fundingAccountId, which you can use to run follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::FundingAccount]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :recipient_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::FundingAccount]
        def create_account(request_options: {}, **params)
          path_param_names = %i[recipient_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "funding-recipients/#{params[:recipient_id]}/funding-accounts",
            body: Payroc::Types::FundingAccount.new(body_params).to_h,
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

        # Use this method to return a list of owners of a funding recipient.
        #
        # **Note:** If you want to view the details of a specific owner and you have their ownerId, use our [Retrieve
        # Owner](https://docs.payroc.com/api/schema/boarding/owners/retrieve) method.
        #
        # To list the owners of a funding recipient, you need its recipientId. Our gateway returned the recipientId in
        # the response of the [Create Funding
        # Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method. If you don't have the
        # recipientId, use our [List Funding
        # Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the
        # funding recipient.
        #
        # Our gateway returns the following information about each owner in the list:
        # -	Name, date of birth, and address.
        # -	Contact details, including their email address.
        # -	Relationship to the funding recipient.
        #
        # Our gateway also returns the ownerId, which you can use to perform follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :recipient_id
        #
        # @return [Array[Payroc::Types::Owner]]
        def list_owners(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "funding-recipients/#{params[:recipient_id]}/owners",
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

        # Use this method to add an additional owner to a funding recipient.
        #
        # To add an owner to a funding recipient, you need the recipientId. Our gateway returned the recipientId in the
        # response of the [Create Funding
        # Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method.
        #
        # **Note:** If you don't have the recipientId, use our [List Funding
        # Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search for the
        # funding recipient.
        #
        # In the request, include the following information about the owner:
        #
        # - Name, date of birth, and address.
        # - Contact details, including their email address.
        # - Relationship to the funding recipient, including whether they are a control prong.
        #
        # In the response, our gateway returns the ownerId, which you can use to run follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::Owner]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :recipient_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::Owner]
        def create_owner(request_options: {}, **params)
          path_param_names = %i[recipient_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "funding-recipients/#{params[:recipient_id]}/owners",
            body: Payroc::Types::Owner.new(body_params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Owner.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
