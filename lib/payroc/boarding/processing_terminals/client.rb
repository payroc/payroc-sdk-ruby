# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingTerminals
      class Client
        # @param client [Payroc::Internal::Http::RawClient]
        #
        # @return [void]
        def initialize(client:)
          @client = client
        end

        # **Important:** You can retrieve a processing terminal only if the terminal order was created using the Payroc
        # API.
        #
        # Use this method to retrieve information about a processing terminal.
        #
        # To retrieve a processing terminal, you need its processingTerminalId. Our gateway returned the
        # processingTerminalId in the response of the [Create Terminal
        # Order](https://docs.payroc.com/api/schema/boarding/processing-accounts/create-terminal-order) method.
        #
        # **Note:** If you don't have the processingTerminalId, use our [Retrieve Terminal
        # Order](https://docs.payroc.com/api/schema/boarding/terminal-orders/retrieve) method or our [List Processing
        # Terminals](https://docs.payroc.com/api/schema/boarding/processing-accounts/list-processing-terminals) method
        # to search for the processing terminal.
        #
        # Our gateway returns the following information about the processing terminal:
        #
        # - Status indicating whether the terminal is active or inactive.
        # - Configuration settings, including gateway settings and application settings.
        # - Features, receipt settings, and security settings.
        # - Devices that use the processing terminal's configuration.
        #
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        #
        # @return [Payroc::Types::ProcessingTerminal]
        def retrieve(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-terminals/#{params[:processing_terminal_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::ProcessingTerminal.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve the host processor configuration of a processing terminal. Integrate with this
        # method only if you use your own gateway and want to validate the processor configuration.
        #
        # Our gateway returns the configuration settings for the merchant and the payment terminal.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :processing_terminal_id
        #
        # @return [Payroc::Types::HostConfiguration]
        def retrieve_host_configuration(request_options: {}, **params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || Payroc::Environment::PRODUCTION,
            method: "GET",
            path: "processing-terminals/#{params[:processing_terminal_id]}/host-configurations",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::HostConfiguration.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
