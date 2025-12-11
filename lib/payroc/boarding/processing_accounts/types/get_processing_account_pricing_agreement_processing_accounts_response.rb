# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        class GetProcessingAccountPricingAgreementProcessingAccountsResponse < Internal::Types::Model
          extend Payroc::Internal::Types::Union

          member -> { Payroc::Types::PricingAgreementUs40 }
          member -> { Payroc::Types::PricingAgreementUs50 }
        end
      end
    end
  end
end
