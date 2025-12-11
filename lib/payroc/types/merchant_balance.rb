# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the total funds available to the merchant.
    class MerchantBalance < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false, api_name: "merchantId"
      field :funds, -> { Integer }, optional: true, nullable: false
      field :pending, -> { Integer }, optional: true, nullable: false
      field :available, -> { Integer }, optional: true, nullable: false
      field :currency, -> { String }, optional: true, nullable: false
    end
  end
end
