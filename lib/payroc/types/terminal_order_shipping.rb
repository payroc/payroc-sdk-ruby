# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the shipping details for the terminal order. If you don't provide a shipping address, we use
    # the Doing Business As (DBA) address of the processing account.
    class TerminalOrderShipping < Internal::Types::Model
      field :preferences, -> { Payroc::Types::TerminalOrderShippingPreferences }, optional: true, nullable: false
      field :address, -> { Payroc::Types::TerminalOrderShippingAddress }, optional: true, nullable: false
    end
  end
end
