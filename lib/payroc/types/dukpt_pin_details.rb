# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about encrypted PIN details.
    class DukptPinDetails < Internal::Types::Model
      field :pin, -> { String }, optional: false, nullable: false
      field :pin_ksn, -> { String }, optional: false, nullable: false, api_name: "pinKsn"
    end
  end
end
