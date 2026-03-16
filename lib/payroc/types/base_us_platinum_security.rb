# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains billing details for Platinum Security.
    #
    # The value of the billingFrequency field determines which variant you should use:
    # -	`monthly` - We collect the fee for Platinum Security each month.
    # -	`annual` - We collect the fee for Platinum Security each year.
    class BaseUsPlatinumSecurity < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :billing_frequency

      member -> { Payroc::Types::PlatinumSecurityMonthly }, key: "MONTHLY"
      member -> { Payroc::Types::PlatinumSecurityAnnual }, key: "ANNUAL"
    end
  end
end
