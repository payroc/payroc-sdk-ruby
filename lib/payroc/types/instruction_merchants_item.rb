# frozen_string_literal: true

module Payroc
  module Types
    # Instruction indicating which recipients should receive funding from the specific merchant balance.
    class InstructionMerchantsItem < Internal::Types::Model
      field :merchant_id, -> { String }, optional: false, nullable: false, api_name: "merchantId"
      field :recipients, -> { Internal::Types::Array[Payroc::Types::InstructionMerchantsItemRecipientsItem] }, optional: false, nullable: false
      field :link, -> { Payroc::Types::InstructionMerchantsItemLink }, optional: true, nullable: false
    end
  end
end
