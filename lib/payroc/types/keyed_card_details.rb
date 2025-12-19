# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the keyed card details.
    class KeyedCardDetails < Internal::Types::Model
      field :keyed_data, -> { Payroc::Types::KeyedCardDetailsKeyedData }, optional: false, nullable: false, api_name: "keyedData"
      field :cardholder_name, -> { String }, optional: true, nullable: false, api_name: "cardholderName"
      field :cardholder_signature, -> { String }, optional: true, nullable: false, api_name: "cardholderSignature"
      field :pin_details, -> { Payroc::Types::KeyedCardDetailsPinDetails }, optional: true, nullable: false, api_name: "pinDetails"
      field :ebt_details, -> { Payroc::Types::EbtDetailsWithVoucher }, optional: true, nullable: false, api_name: "ebtDetails"
    end
  end
end
