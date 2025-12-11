# frozen_string_literal: true

module Payroc
  module Types
    class SubscriptionOrderBreakdownBase < Internal::Types::Model
      field :subtotal, -> { Integer }, optional: false, nullable: false
      field :convenience_fee, -> { Payroc::Types::ConvenienceFee }, optional: true, nullable: false, api_name: "convenienceFee"
    end
  end
end
