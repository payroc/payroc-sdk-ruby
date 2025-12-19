# frozen_string_literal: true

module Payroc
  module Types
    class Tiered4AmexDirect < Internal::Types::Model
      field :transaction, -> { Integer }, optional: false, nullable: false
    end
  end
end
