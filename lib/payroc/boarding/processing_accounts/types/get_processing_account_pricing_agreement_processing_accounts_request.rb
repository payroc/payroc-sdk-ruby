# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        class GetProcessingAccountPricingAgreementProcessingAccountsRequest < Internal::Types::Model
          field :processing_account_id, -> { String }, optional: false, nullable: false, api_name: "processingAccountId"
        end
      end
    end
  end
end
