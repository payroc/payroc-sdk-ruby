# frozen_string_literal: true

module Payroc
  module Types
    class PaginatedContacts < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::Contact] }, optional: true, nullable: false
    end
  end
end
