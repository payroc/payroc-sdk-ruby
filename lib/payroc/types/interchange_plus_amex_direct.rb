# frozen_string_literal: true

module Payroc
  module Types
    class InterchangePlusAmexDirect < Internal::Types::Model
      field :transaction, -> { Integer }, optional: false, nullable: false
    end
  end
end
