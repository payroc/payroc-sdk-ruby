# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the Platinum Security fee.
    class BaseUsPlatinumSecurity < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :billing_frequency

      member -> { Payroc::Types::BaseUsMonthly }, key: "MONTHLY"
      member -> { Payroc::Types::BaseUsAnnual }, key: "ANNUAL"
    end
  end
end
