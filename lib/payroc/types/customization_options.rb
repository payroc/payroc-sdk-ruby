# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains available options to customize certain aspects of an instruction.
    class CustomizationOptions < Internal::Types::Model
      field :ebt_details, -> { Payroc::Types::EbtDetails }, optional: true, nullable: false, api_name: "ebtDetails"
      field :entry_method, -> { Payroc::Types::CustomizationOptionsEntryMethod }, optional: true, nullable: false, api_name: "entryMethod"
    end
  end
end
