# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class RetrieveAchDepositSettlementRequest < Internal::Types::Model
          field :ach_deposit_id, -> { Integer }, optional: false, nullable: false, api_name: "achDepositId"
        end
      end
    end
  end
end
