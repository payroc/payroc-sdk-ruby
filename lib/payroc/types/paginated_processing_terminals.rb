# frozen_string_literal: true

module Payroc
  module Types
    class PaginatedProcessingTerminals < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::ProcessingTerminal] }, optional: true, nullable: false
    end
  end
end
