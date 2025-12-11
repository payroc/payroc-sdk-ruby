# frozen_string_literal: true

module Payroc
  module Types
    class PaymentPaginatedListForRead < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::RetrievedPayment] }, optional: true, nullable: false
    end
  end
end
