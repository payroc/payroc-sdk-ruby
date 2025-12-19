# frozen_string_literal: true

module Payroc
  module Types
    class PaymentLinkPaginatedList < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::PaymentLinkPaginatedListDataItem] }, optional: true, nullable: false
    end
  end
end
