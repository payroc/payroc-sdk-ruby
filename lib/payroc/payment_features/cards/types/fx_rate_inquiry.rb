# frozen_string_literal: true

module Payroc
  module PaymentFeatures
    module Cards
      module Types
        class FxRateInquiry < Internal::Types::Model
          field :channel, -> { Payroc::PaymentFeatures::Cards::Types::FxRateInquiryChannel }, optional: false, nullable: false
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :operator, -> { String }, optional: true, nullable: false
          field :base_amount, -> { Integer }, optional: false, nullable: false, api_name: "baseAmount"
          field :base_currency, -> { Payroc::Types::Currency }, optional: false, nullable: false, api_name: "baseCurrency"
          field :payment_method, -> { Payroc::PaymentFeatures::Cards::Types::FxRateInquiryPaymentMethod }, optional: false, nullable: false, api_name: "paymentMethod"
        end
      end
    end
  end
end
