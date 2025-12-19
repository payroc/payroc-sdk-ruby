# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the Integrated Circuit Card (ICC).
    class IccCardDetails < Internal::Types::Model
      field :downgrade_to, -> { Payroc::Types::IccCardDetailsDowngradeTo }, optional: true, nullable: false, api_name: "downgradeTo"
      field :device, -> { Payroc::Types::EncryptionCapableDevice }, optional: false, nullable: false
      field :icc_data, -> { String }, optional: false, nullable: false, api_name: "iccData"
      field :first_digit_of_pan, -> { String }, optional: true, nullable: false, api_name: "firstDigitOfPan"
      field :cardholder_signature, -> { String }, optional: true, nullable: false, api_name: "cardholderSignature"
      field :ebt_details, -> { Payroc::Types::EbtDetailsWithVoucher }, optional: true, nullable: false, api_name: "ebtDetails"
    end
  end
end
