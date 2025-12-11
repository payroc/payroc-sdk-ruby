# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains details about EBT transactions.
    class EbtEnabled < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :ebt_type, -> { Payroc::Types::EbtEnabledEbtType }, optional: false, nullable: false, api_name: "ebtType"
      field :fns_number, -> { String }, optional: true, nullable: false, api_name: "fnsNumber"
    end
  end
end
