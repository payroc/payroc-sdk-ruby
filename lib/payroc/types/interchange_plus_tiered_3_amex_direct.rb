# frozen_string_literal: true

module Payroc
  module Types
    class InterchangePlusTiered3AmexDirect < Internal::Types::Model
      field :transaction, -> { Integer }, optional: false, nullable: false
    end
  end
end
