# frozen_string_literal: true

module Payroc
  module Types
    class SubscriptionPaginatedList < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::Subscription] }, optional: true, nullable: false
    end
  end
end
