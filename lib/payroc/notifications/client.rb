# frozen_string_literal: true

module Payroc
  module Notifications
    class Client
      # @param client [Payroc::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Payroc::EventSubscriptions::Client]
      def event_subscriptions
        @event_subscriptions ||= Payroc::Notifications::EventSubscriptions::Client.new(client: @client)
      end
    end
  end
end
