# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the breakdown of the transaction.
    class ItemizedBreakdown < Internal::Types::Model
      field :duty_amount, -> { Integer }, optional: true, nullable: false, api_name: "dutyAmount"
      field :freight_amount, -> { Integer }, optional: true, nullable: false, api_name: "freightAmount"
      field :convenience_fee, -> { Payroc::Types::ConvenienceFee }, optional: true, nullable: false, api_name: "convenienceFee"
      field :items, -> { Internal::Types::Array[Payroc::Types::LineItem] }, optional: true, nullable: false
    end
  end
end
