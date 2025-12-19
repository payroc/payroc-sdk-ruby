# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the funds that we send to the funding account.
    class InstructionMerchantsItemRecipientsItemAmount < Internal::Types::Model
      field :value, -> { Integer }, optional: false, nullable: false
      field :currency, -> { Payroc::Types::InstructionMerchantsItemRecipientsItemAmountCurrency }, optional: true, nullable: false
    end
  end
end
