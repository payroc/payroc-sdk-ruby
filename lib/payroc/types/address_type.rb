# frozen_string_literal: true

module Payroc
  module Types
    # Type of address.
    class AddressType < Internal::Types::Model
      field :type, -> { Payroc::Types::AddressTypeType }, optional: false, nullable: false
    end
  end
end
