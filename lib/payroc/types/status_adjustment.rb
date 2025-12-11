# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the adjustment to the transaction. Send this object if the merchant is
    # adjusting the status of the transaction.
    class StatusAdjustment < Internal::Types::Model
      field :to_status, -> { Payroc::Types::StatusAdjustmentToStatus }, optional: false, nullable: false, api_name: "toStatus"
    end
  end
end
