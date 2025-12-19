# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the payment details for the customer’s preauthorized electronic debit (PAD)
    # transactions.
    class PadPayload < Internal::Types::Model
      field :account_type, -> { Payroc::Types::PadPayloadAccountType }, optional: true, nullable: false, api_name: "accountType"
      field :name_on_account, -> { String }, optional: false, nullable: false, api_name: "nameOnAccount"
      field :account_number, -> { String }, optional: false, nullable: false, api_name: "accountNumber"
      field :transit_number, -> { String }, optional: false, nullable: false, api_name: "transitNumber"
      field :institution_number, -> { String }, optional: false, nullable: false, api_name: "institutionNumber"
    end
  end
end
