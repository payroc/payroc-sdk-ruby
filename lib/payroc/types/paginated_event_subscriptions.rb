# frozen_string_literal: true

module Payroc
  module Types
    class PaginatedEventSubscriptions < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::EventSubscription] }, optional: true, nullable: false
    end
  end
end
