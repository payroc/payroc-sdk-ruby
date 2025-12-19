# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the fees for PIN-debit transactions.
    class PinDebit < Internal::Types::Model
      field :additional_discount, -> { Integer }, optional: false, nullable: false, api_name: "additionalDiscount"
      field :transaction, -> { Integer }, optional: false, nullable: false
      field :monthly_access, -> { Integer }, optional: false, nullable: false, api_name: "monthlyAccess"
    end
  end
end
