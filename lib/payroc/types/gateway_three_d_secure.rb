# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the 3-D Secure information from our gateway.
    class GatewayThreeDSecure < Internal::Types::Model
      field :mpi_reference, -> { String }, optional: false, nullable: false, api_name: "mpiReference"
    end
  end
end
