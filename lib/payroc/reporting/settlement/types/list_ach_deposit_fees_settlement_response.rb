# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class ListAchDepositFeesSettlementResponse < Internal::Types::Model
          field :data, -> { Internal::Types::Array[Payroc::Types::AchDepositFee] }, optional: false, nullable: false
        end
      end
    end
  end
end
