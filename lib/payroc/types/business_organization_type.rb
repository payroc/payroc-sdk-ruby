# frozen_string_literal: true

module Payroc
  module Types
    module BusinessOrganizationType
      extend Payroc::Internal::Types::Enum

      PRIVATE_CORPORATION = "privateCorporation"
      PUBLIC_CORPORATION = "publicCorporation"
      NON_PROFIT = "nonProfit"
      PRIVATE_LLC = "privateLlc"
      PUBLIC_LLC = "publicLlc"
      PRIVATE_PARTNERSHIP = "privatePartnership"
      PUBLIC_PARTNERSHIP = "publicPartnership"
      SOLE_PROPRIETOR = "soleProprietor"
    end
  end
end
