# frozen_string_literal: true

module Payroc
  module Types
    # Foreign exchange rate for the transaction.
    class FxRate < Internal::Types::Model
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :operator, -> { String }, optional: true, nullable: false
      field :base_amount, -> { Integer }, optional: false, nullable: false, api_name: "baseAmount"
      field :base_currency, -> { Payroc::Types::Currency }, optional: false, nullable: false, api_name: "baseCurrency"
      field :inquiry_result, -> { Payroc::Types::FxRateInquiryResult }, optional: false, nullable: false, api_name: "inquiryResult"
      field :dcc_offer, -> { Payroc::Types::DccOffer }, optional: true, nullable: false, api_name: "dccOffer"
      field :card_info, -> { Payroc::Types::CardInfo }, optional: false, nullable: false, api_name: "cardInfo"
    end
  end
end
