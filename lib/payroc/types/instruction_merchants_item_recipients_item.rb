# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the target funding account.
    class InstructionMerchantsItemRecipientsItem < Internal::Types::Model
      field :funding_account_id, -> { Integer }, optional: false, nullable: false, api_name: "fundingAccountId"
      field :payment_method, -> { Payroc::Types::InstructionMerchantsItemRecipientsItemPaymentMethod }, optional: false, nullable: false, api_name: "paymentMethod"
      field :amount, -> { Payroc::Types::InstructionMerchantsItemRecipientsItemAmount }, optional: false, nullable: false
      field :status, -> { Payroc::Types::InstructionMerchantsItemRecipientsItemStatus }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      field :link, -> { Payroc::Types::InstructionMerchantsItemRecipientsItemLink }, optional: true, nullable: false
    end
  end
end
