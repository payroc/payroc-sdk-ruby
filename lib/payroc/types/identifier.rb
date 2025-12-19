# frozen_string_literal: true

module Payroc
  module Types
    class Identifier < Internal::Types::Model
      field :type, -> { Payroc::Types::IdentifierType }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
