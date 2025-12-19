# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the unencrypted card details.
    class RawCardDetails < Internal::Types::Model
      field :downgrade_to, -> { Payroc::Types::RawCardDetailsDowngradeTo }, optional: true, nullable: false, api_name: "downgradeTo"
      field :device, -> { Payroc::Types::Device }, optional: false, nullable: false
      field :raw_data, -> { String }, optional: false, nullable: false, api_name: "rawData"
      field :cardholder_signature, -> { String }, optional: true, nullable: false, api_name: "cardholderSignature"
    end
  end
end
