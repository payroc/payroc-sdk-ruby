# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class ListAuthorizationsSettlementResponse < Internal::Types::Model
          field :data, -> { Internal::Types::Array[Payroc::Types::Authorization] }, optional: false, nullable: false
        end
      end
    end
  end
end
