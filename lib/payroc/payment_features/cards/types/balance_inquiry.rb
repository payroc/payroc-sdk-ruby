# frozen_string_literal: true

module Payroc
  module PaymentFeatures
    module Cards
      module Types
        class BalanceInquiry < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :operator, -> { String }, optional: true, nullable: false
          field :currency, -> { Payroc::Types::Currency }, optional: false, nullable: false
          field :customer, -> { Payroc::Types::Customer }, optional: true, nullable: false
          field :card, -> { Payroc::PaymentFeatures::Cards::Types::BalanceInquiryCard }, optional: false, nullable: false
        end
      end
    end
  end
end
