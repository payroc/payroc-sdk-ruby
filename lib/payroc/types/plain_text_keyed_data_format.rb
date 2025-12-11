# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the plain-text card data for keyed transactions.
    class PlainTextKeyedDataFormat < Internal::Types::Model
      field :device, -> { Payroc::Types::Device }, optional: true, nullable: false
      field :card_number, -> { String }, optional: false, nullable: false, api_name: "cardNumber"
      field :expiry_date, -> { String }, optional: true, nullable: false, api_name: "expiryDate"
      field :cvv, -> { String }, optional: true, nullable: false
      field :issue_number, -> { String }, optional: true, nullable: false, api_name: "issueNumber"
    end
  end
end
