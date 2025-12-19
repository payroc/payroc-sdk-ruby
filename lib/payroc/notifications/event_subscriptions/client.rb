# frozen_string_literal: true

module Payroc
  module Notifications
    module EventSubscriptions
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

        # Use this method to return a [paginated](https://docs.payroc.com/api/pagination) list of event subscriptions
        # that are linked to your ISV account.
        #
        # **Note:** If you want to view the details of a specific event subscription and you have its id, use our
        # [Retrieve Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/retrieve)
        # method.
        #
        # Use query parameters to filter the list of results that we return, for example, to search for subscriptions
        # with a specific status or an event type.
        #
        # Our gateway returns the following information about each subscription in the list:
        # - Event types that you have subscribed to.
        # - Whether you have enabled notifications for the subscription.
        # - How we contact you when an event occurs, including the endpoint that send notifications to.
        # - If there are any issues when we try to send you a notification, for example, if we can't contact your
        # endpoint.
        #
        # For each event subscription, we also return its id, which you can use to perform follow-on actions.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Payroc::Notifications::EventSubscriptions::Types::ListEventSubscriptionsRequestStatus, nil] :status
        # @option params [String, nil] :event
        #
        # @return [Payroc::Types::PaginatedEventSubscriptions]
        def list(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          query_param_names = %i[status event]
          query_params = {}
          query_params["status"] = params[:status] if params.key?(:status)
          query_params["event"] = params[:event] if params.key?(:event)
          params.except(*query_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "event-subscriptions",
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
            parsed_response = Payroc::Types::PaginatedEventSubscriptions.load(response.body)
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

        # Use this method to create an event subscription that we use to notify you when an event occurs, for example,
        # when we change the status of a processing account.
        #
        # In the request, include the events that you want to subscribe to and the public endpoint that we send event
        # notifications to. For a complete list of events that you can subscribe to, go to [Events
        # List](https://docs.payroc.com/knowledge/events/events-list).
        #
        # In the response, our gateway returns the id of the event subscription, which you can use to perform follow-on
        # actions.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::EventSubscription]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::EventSubscription]
        def create(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "POST",
            path: "event-subscriptions",
            headers: headers,
            body: Payroc::Types::EventSubscription.new(params).to_h,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::EventSubscription.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to retrieve the details of an event subscription.
        #
        # In your request, include the subscriptionId that we sent to you when we created the event subscription.
        #
        # **Note:** If you don't know the subscriptionId of the event subscription, go to [List event
        # subscriptions](#listEventSubscriptions).
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :subscription_id
        #
        # @return [Payroc::Types::EventSubscription]
        def retrieve(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "GET",
            path: "event-subscriptions/#{params[:subscription_id]}",
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::EventSubscription.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end

        # Use this method to update the details of an event subscription.
        #
        # To update an event subscription, you need its subscriptionId. Our gateway returned the subscriptionId in the
        # response of the [Create Event
        # Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/create) method.
        #
        # **Note:** If you don’t have the subscriptionId, use our [List Event
        # Subscriptions](https://docs.payroc.com/api/schema/notifications/event-subscriptions/list) method to search for
        # the event subscription.
        #
        # You can update the following details about an event subscription:
        #
        # - Status of the event subscription.
        # - Events that you have subscribed to. For a list of events that you can subscribe to, go to [Events
        # list](https://docs.payroc.com/knowledge/events/events-list).
        # - Information about how we contact you when an event occurs.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::EventSubscription]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :subscription_id
        #
        # @return [untyped]
        def update(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[subscription_id]
          body_params = params.except(*path_param_names)

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "PUT",
            path: "event-subscriptions/#{params[:subscription_id]}",
            body: Payroc::Types::EventSubscription.new(body_params).to_h,
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

        # Use this method to delete an event subscription.
        #
        # > **Important:** After you delete an event subscription, you can’t recover it. You won't receive event
        # notifications from the event subscription.
        #
        # To delete an event subscription, you need its subscriptionId. Our gateway returned the subscriptionId in the
        # response of the [Create Event
        # Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/create) method.
        #
        # If you want to stop receiving event notifications but don't want to delete the event subscription, use our
        # [Update Event Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/update)
        # method to deactivate it.
        #
        # @param request_options [Hash]
        # @param params [Hash]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :subscription_id
        #
        # @return [untyped]
        def delete(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "DELETE",
            path: "event-subscriptions/#{params[:subscription_id]}",
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

        # Use this method to partially update an event subscription. Structure your request to follow the [RFC
        # 6902](https://datatracker.ietf.org/doc/html/rfc6902) standard.
        #
        # To update an event subscription, you need its subscriptionId. Our gateway returned the subscriptionId in the
        # id field in the response of the [Create Event
        # Subscription](https://docs.payroc.com/api/schema/notifications/event-subscriptions/create) method.
        #
        # **Note:** If you don't have the subscriptionId, use our [List Event
        # Subscriptions](https://docs.payroc.com/api/schema/notifications/event-subscriptions/list) method to search for
        # the subscription.
        #
        # You can update the following properties of an event subscription:
        # - **eventTypes** - Subscribe to new events or remove events that you are subscribed to.
        # - **notifications** - Information about your endpoint and who we email if we can't contact your endpoint.
        # - **enabled** - Turn on or turn off notifications for the subscription.
        #
        # @param request_options [Hash]
        # @param params [Payroc::Types::PatchRequest]
        # @option request_options [String] :base_url
        # @option request_options [Hash{String => Object}] :additional_headers
        # @option request_options [Hash{String => Object}] :additional_query_parameters
        # @option request_options [Hash{String => Object}] :additional_body_parameters
        # @option request_options [Integer] :timeout_in_seconds
        # @option params [Integer] :subscription_id
        # @option params [String] :idempotency_key
        #
        # @return [Payroc::Types::EventSubscription]
        def partially_update(request_options: {}, **params)
          params = Payroc::Internal::Types::Utils.normalize_keys(params)
          path_param_names = %i[subscription_id]
          body_params = params.except(*path_param_names)

          headers = {}
          headers["Idempotency-Key"] = params[:idempotency_key] if params[:idempotency_key]

          request = Payroc::Internal::JSON::Request.new(
            base_url: request_options[:base_url] || @base_url || @environment&.dig(:api),
            method: "PATCH",
            path: "event-subscriptions/#{params[:subscription_id]}",
            headers: headers,
            body: body_params,
            request_options: request_options
          )
          begin
            response = @client.send(request)
          rescue Net::HTTPRequestTimeout
            raise Payroc::Errors::TimeoutError
          end
          code = response.code.to_i
          if code.between?(200, 299)
            Payroc::Types::EventSubscription.load(response.body)
          else
            error_class = Payroc::Errors::ResponseError.subclass_for_code(code)
            raise error_class.new(response.body, code: code)
          end
        end
      end
    end
  end
end
