# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the unencrypted PIN details.
    class RawPinDetails < Internal::Types::Model
      field :pin, -> { String }, optional: false, nullable: false
    end
  end
end
