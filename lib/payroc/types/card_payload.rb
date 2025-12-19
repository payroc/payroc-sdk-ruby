# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the customer’s payment card.
    class CardPayload < Internal::Types::Model
      field :account_type, -> { Payroc::Types::CardPayloadAccountType }, optional: true, nullable: false, api_name: "accountType"
      field :card_details, -> { Payroc::Types::CardPayloadCardDetails }, optional: false, nullable: false, api_name: "cardDetails"
    end
  end
end
