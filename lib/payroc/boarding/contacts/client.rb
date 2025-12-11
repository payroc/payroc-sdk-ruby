# frozen_string_literal: true

module Payroc
  module Boarding
    module Contacts
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to retrieve details about a contact.
        #
        # To retrieve a contact, you need its contactId. Our gateway returned the contactId in the [Create Processing
        # Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.
        #
        # **Note:** If you don't have the contactId, use the [List
        # Contacts](https://docs.payroc.com/api/schema/boarding/processing-accounts/list-contacts) method to search for
        # the contact.
        #
        # Our gateway returns the following information about a contact:
        #
        # -	Name and contact method, including their phone number or mobile number.
        # -	Role within the business, for example, if they are a manager.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :contact_id
        #
        # @return [Payroc::Types::Contact]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "contacts/#{params[:contact_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::Contact.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to update a contact of a processing account.
        #
        # To update a contact, you need its contactId. Our gateway returned the contactId in the response of the [Create
        # Processing Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account)
        # method.
        #
        # **Note:** If you don't have the contactId, use our [List
        # Contacts](https://docs.payroc.com/api/schema/boarding/processing-accounts/list-contacts) method to search for
        # the contact.
        #
        # You can update the following details about a contact:
        #
        # -	First name and last name.
        # -	Contact details, including their phone number or mobile number.
        # -	Identification details, including their identification type and number.
        # -	Role within the business, for example, if they are a manager.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::Contact]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :contact_id
        #
        # @return [untyped]
        def update(request_options: {}, **params)
          path_param_names = %i[contact_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "PUT",
            path: "contacts/#{params[:contact_id]}",
            body: Payroc::Types::Contact.new(body_params).to_h,
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

        # Use this method to delete a contact associated with a processing account.
        #
        # To delete a contact, you need their contactId. Our gateway returned the contactId in the response of the
        # [Create Processing
        # Account](https://docs.payroc.com/api/schema/boarding/merchant-platforms/create-processing-account) method.
        #
        # **Note:** If you don’t have the contactId, use our [Retrieve Processing
        # Account](https://docs.payroc.com/api/schema/boarding/processing-accounts/retrieve) method or our [List
        # Contacts](https://docs.payroc.com/api/schema/boarding/processing-accounts/list-contacts) method to search for
        # the contact.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :contact_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "DELETE",
            path: "contacts/#{params[:contact_id]}",
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
