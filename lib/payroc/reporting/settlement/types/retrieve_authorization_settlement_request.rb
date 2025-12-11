# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class RetrieveAuthorizationSettlementRequest < Internal::Types::Model
          field :authorization_id, -> { Integer }, optional: false, nullable: false, api_name: "authorizationId"
        end
      end
    end
  end
end
