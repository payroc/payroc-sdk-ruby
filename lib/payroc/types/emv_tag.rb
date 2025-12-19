# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the EMV tag.
    class EmvTag < Internal::Types::Model
      field :hex, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
