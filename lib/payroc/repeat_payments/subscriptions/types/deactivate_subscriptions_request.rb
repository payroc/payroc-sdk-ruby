# frozen_string_literal: true

module Payroc
  module RepeatPayments
    module Subscriptions
      module Types
        class DeactivateSubscriptionsRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :subscription_id, -> { String }, optional: false, nullable: false, api_name: "subscriptionId"
        end
      end
    end
  end
end
