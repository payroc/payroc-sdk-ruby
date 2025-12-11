# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the gateway fees for MPA 5.0.
    class GatewayUs50 < Internal::Types::Model
      field :fees, -> { Payroc::Types::GatewayUs50Fees }, optional: false, nullable: false
    end
  end
end
