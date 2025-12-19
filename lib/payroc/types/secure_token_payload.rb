# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the secure token that represents the customer’s payment details.
    class SecureTokenPayload < Internal::Types::Model
      field :account_type, -> { Payroc::Types::SecureTokenPayloadAccountType }, optional: true, nullable: false, api_name: "accountType"
      field :token, -> { String }, optional: false, nullable: false
      field :sec_code, -> { Payroc::Types::SecureTokenPayloadSecCode }, optional: true, nullable: false, api_name: "secCode"
    end
  end
end
