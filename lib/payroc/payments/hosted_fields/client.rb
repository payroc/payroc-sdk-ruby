# frozen_string_literal: true

module Payroc
  module Payments
    module HostedFields
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # Use this method to create a Hosted Fields session token. You need to generate a new session token each time
        # you load Hosted Fields on a webpage.
        #
        # In your request, you need to indicate whether the merchant is using Hosted Fields to run a sale, save payment
        # details, or update saved payment details.
        #
        # In the response, our gateway returns the session token and the time that it expires. You need the session
        # token when you configure the JavaScript for Hosted Fields.
        #
        # For more information about adding Hosted Fields to a webpage, go to [Hosted
        # Fields](https://docs.payroc.com/guides/integrate/hosted-fields).
        #
        # @param request_options [Hash]
        # @param params [Payroc::Payments::HostedFields::Types::HostedFieldsCreateSessionRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::HostedFieldsCreateSessionResponse]
        def create(request_options: {}, **params)
          path_param_names = %i[processing_terminal_id]
          body_params = params.except(*path_param_names)
          body_prop_names = %i[lib_version scenario secure_token_id]
          body_bag = body_params.slice(*body_prop_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "POST",
            path: "processing-terminals/#{params[:processing_terminal_id]}/hosted-fields-sessions",
            body: Payroc::Payments::HostedFields::Types::HostedFieldsCreateSessionRequest.new(body_bag).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::HostedFieldsCreateSessionResponse.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
