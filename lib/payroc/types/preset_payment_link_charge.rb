# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the charge when the merchant enters the amount of the transaction.
    class PresetPaymentLinkCharge < Internal::Types::Model
      field :amount, -> { Integer }, optional: false, nullable: false
      field :currency, -> { Payroc::Types::Currency }, optional: false, nullable: false
    end
  end
end
