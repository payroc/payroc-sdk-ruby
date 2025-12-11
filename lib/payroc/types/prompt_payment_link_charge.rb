# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the charge when the customer enters the amount of the transaction.
    class PromptPaymentLinkCharge < Internal::Types::Model
      field :currency, -> { Payroc::Types::Currency }, optional: false, nullable: false
    end
  end
end
