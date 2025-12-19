# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        # Object that contains the shipping details for the terminal order. If you don't provide a shipping address, we
        # use the Doing Business As (DBA) address of the processing account.
        class CreateTerminalOrderShipping < Internal::Types::Model
          field :preferences, -> { Payroc::Boarding::ProcessingAccounts::Types::CreateTerminalOrderShippingPreferences }, optional: true, nullable: false
          field :address, -> { Payroc::Boarding::ProcessingAccounts::Types::CreateTerminalOrderShippingAddress }, optional: true, nullable: false
        end
      end
    end
  end
end
