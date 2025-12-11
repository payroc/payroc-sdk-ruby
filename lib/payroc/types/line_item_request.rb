# frozen_string_literal: true

module Payroc
  module Types
    class LineItemRequest < Internal::Types::Model
      field :taxes, -> { Internal::Types::Array[Payroc::Types::Tax] }, optional: true, nullable: false
    end
  end
end
