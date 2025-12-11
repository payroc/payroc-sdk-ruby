# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the single-use token, which represents the customer’s payment details.
    class SingleUseTokenPayload < Internal::Types::Model
      field :account_type, -> { Payroc::Types::SingleUseTokenPayloadAccountType }, optional: true, nullable: false, api_name: "accountType"
      field :token, -> { String }, optional: false, nullable: false
      field :pin_details, -> { Payroc::Types::SingleUseTokenPayloadPinDetails }, optional: true, nullable: false, api_name: "pinDetails"
      field :ebt_details, -> { Payroc::Types::EbtDetailsWithVoucher }, optional: true, nullable: false, api_name: "ebtDetails"
      field :sec_code, -> { Payroc::Types::SingleUseTokenPayloadSecCode }, optional: true, nullable: false, api_name: "secCode"
    end
  end
end
