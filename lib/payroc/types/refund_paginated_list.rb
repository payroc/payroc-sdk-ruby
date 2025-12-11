# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about refund objects.
    class RefundPaginatedList < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::RetrievedRefund] }, optional: true, nullable: false
    end
  end
end
