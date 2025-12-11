# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the gateway fees.
    class GatewayUs < Internal::Types::Model
      field :fees, -> { Payroc::Types::GatewayUsFees }, optional: false, nullable: false
    end
  end
end
