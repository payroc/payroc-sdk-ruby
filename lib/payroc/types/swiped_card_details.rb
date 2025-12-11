# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the customer’s card details for swiped transactions.
    class SwipedCardDetails < Internal::Types::Model
      field :downgrade_to, -> { Payroc::Types::SwipedCardDetailsDowngradeTo }, optional: true, nullable: false, api_name: "downgradeTo"
      field :swiped_data, -> { Payroc::Types::SwipedCardDetailsSwipedData }, optional: false, nullable: false, api_name: "swipedData"
      field :cardholder_name, -> { String }, optional: true, nullable: false, api_name: "cardholderName"
      field :cardholder_signature, -> { String }, optional: true, nullable: false, api_name: "cardholderSignature"
      field :pin_details, -> { Payroc::Types::SwipedCardDetailsPinDetails }, optional: true, nullable: false, api_name: "pinDetails"
      field :ebt_details, -> { Payroc::Types::EbtDetailsWithVoucher }, optional: true, nullable: false, api_name: "ebtDetails"
    end
  end
end
