# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the gateway fees for MPA 5.2.
    class GatewayUs52 < Internal::Types::Model
      field :fees, -> { Payroc::Types::GatewayUs52Fees }, optional: false, nullable: false
    end
  end
end
