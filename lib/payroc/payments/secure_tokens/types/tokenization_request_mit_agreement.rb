# frozen_string_literal: true

module Payroc
  module Payments
    module SecureTokens
      module Types
        module TokenizationRequestMitAgreement
          extend Payroc::Internal::Types::Enum

          UNSCHEDULED = "unscheduled"
          RECURRING = "recurring"
          INSTALLMENT = "installment"
        end
      end
    end
  end
end
