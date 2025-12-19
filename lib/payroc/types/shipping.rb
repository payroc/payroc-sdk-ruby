# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the customer and their shipping address.
    class Shipping < Internal::Types::Model
      field :recipient_name, -> { String }, optional: true, nullable: false, api_name: "recipientName"
      field :address, -> { Payroc::Types::Address }, optional: true, nullable: false
    end
  end
end
