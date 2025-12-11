# frozen_string_literal: true

module Payroc
  module Reporting
    class Client
      # @param client [Payroc::Internal::Http::RawClient]
      #
      # @return [void]
      def initialize(client:)
        @client = client
      end

      # @return [Payroc::Settlement::Client]
      def settlement
        @settlement ||= Payroc::Reporting::Settlement::Client.new(client: @client)
      end
    end
  end
end
