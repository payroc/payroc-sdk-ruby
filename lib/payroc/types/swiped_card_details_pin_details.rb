# frozen_string_literal: true

module Payroc
  module Types
    class SwipedCardDetailsPinDetails < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :data_format

      member -> { Payroc::Types::DukptPinDetails }, key: "DUKPT"
    end
  end
end
