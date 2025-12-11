# frozen_string_literal: true

module Payroc
  module Types
    class SharingEventPaginatedList < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::PaymentLinkEmailShareEvent] }, optional: true, nullable: false
    end
  end
end
