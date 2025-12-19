# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        module CreateTerminalOrderShippingPreferencesMethod
          extend Payroc::Internal::Types::Enum

          NEXT_DAY = "nextDay"
          GROUND = "ground"
        end
      end
    end
  end
end
