# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the annual fee.
    class BaseUsAnnualFee < Internal::Types::Model
      field :bill_in_month, -> { Payroc::Types::BaseUsAnnualFeeBillInMonth }, optional: true, nullable: false, api_name: "billInMonth"
      field :amount, -> { Integer }, optional: false, nullable: false
    end
  end
end
