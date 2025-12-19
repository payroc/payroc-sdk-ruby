# frozen_string_literal: true

module Payroc
  module Funding
    module FundingRecipients
      module Types
        module CreateFundingRecipientRecipientType
          extend Payroc::Internal::Types::Enum

          PRIVATE_CORPORATION = "privateCorporation"
          PUBLIC_CORPORATION = "publicCorporation"
          NON_PROFIT = "nonProfit"
          GOVERNMENT = "government"
          PRIVATE_LLC = "privateLlc"
          PUBLIC_LLC = "publicLlc"
          PRIVATE_PARTNERSHIP = "privatePartnership"
          PUBLIC_PARTNERSHIP = "publicPartnership"
          SOLE_PROPRIETOR = "soleProprietor"
        end
      end
    end
  end
end
