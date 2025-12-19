# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        class CreateReminderProcessingAccountsRequestBody < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          discriminant :type

          member -> { Payroc::Types::PricingAgreementReminder }, key: "PRICING_AGREEMENT"
        end
      end
    end
  end
end
