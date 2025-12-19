# frozen_string_literal: true

module Payroc
  module PaymentFeatures
    module Cards
      module Types
        class BinLookup < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: true, nullable: false, api_name: "processingTerminalId"
          field :amount, -> { Integer }, optional: true, nullable: false
          field :currency, -> { Payroc::Types::Currency }, optional: true, nullable: false
          field :card, -> { Payroc::PaymentFeatures::Cards::Types::BinLookupCard }, optional: false, nullable: false
        end
      end
    end
  end
end
