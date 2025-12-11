# frozen_string_literal: true

module Payroc
  module Boarding
    module Owners
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to retrieve details about an owner of a processing account or an owner associated with a
        # funding recipient.
        #
        # To retrieve an owner, you need their ownerId. Our gateway returned the ownerId in the response of the [Create
        # Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account)
        # method or the [Create Funding Recipient
        # Owner](https://docs.payroc.com/api/schema/funding/funding-recipients/create-owner) method.
        #
        # **Note:** If you don't have the ownerId, use the [Retrieve Processing
        # Account](https://docs.payroc.com/api/schema/boarding/processing-accounts/retrieve) method if you are searching
        # for a processing account owner, or use the [List Funding Recipient
        # Owners](https://docs.payroc.com/api/schema/funding/funding-recipients/list-owners) method if you are searching
        # for a funding recipient owner.
        #
        # Our gateway returns the following information about an owner:
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
        # @option params [Integer] :owner_id
        #
        # @return [Payroc::Types::Owner]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "owners/#{params[:owner_id]}",
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

        # > **Important:** You can't update the details of an owner of a processing account.
        #
        # Use this method to update the details of an owner associated with a funding recipient.
        #
        # To update an owner, you need their ownerId. Our gateway returned the ownerId in the response of the [Create
        # Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method and the
        # [Create Funding Recipient Owner](https://docs.payroc.com/api/schema/funding/funding-recipients/create-owner)
        # method.
        #
        # **Note:** If you don't have the ownerId, use the [List Funding Recipient
        # Owners](https://docs.payroc.com/api/schema/funding/funding-recipients/list-owners) method, the [Retrieve
        # Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/retrieve) method, or the
        # [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search
        # for the funding recipient owner.
        #
        # You can update the following details about an owner:
        #
        # - Personal details, including their name, date of birth, and address.
        # - Identification details, including their identification type and number.
        # - Contact details, including their email address.
        # - Relationship to the business, including whether they are a control prong.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::Owner]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :owner_id
        #
        # @return [untyped]
        def update(request_options: {}, **params)
          path_param_names = %i[owner_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "PUT",
            path: "owners/#{params[:owner_id]}",
            body: Payroc::Types::Owner.new(body_params).to_h,
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

        # > **Important:** You can't delete an owner of a processing account.
        #
        # Use this method to delete an owner associated with a funding recipient. You can delete an owner only if the
        # funding recipient has more than one owner.
        #
        # To delete an owner, you need their ownerId. Our gateway returned the ownerId in the response of the [Create
        # Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/create) method and the
        # [Create Funding Recipient Owner](https://docs.payroc.com/api/schema/funding/funding-recipients/create-owner)
        # method.
        #
        # **Note:** If you don't have the ownerId, use the [List Funding Recipient
        # Owners](https://docs.payroc.com/api/schema/funding/funding-recipients/list-owners) method, the [Retrieve
        # Funding Recipient](https://docs.payroc.com/api/schema/funding/funding-recipients/retrieve) method, or the
        # [List Funding Recipients](https://docs.payroc.com/api/schema/funding/funding-recipients/list) method to search
        # for the funding recipient owner.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :owner_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "DELETE",
            path: "owners/#{params[:owner_id]}",
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
