# frozen_string_literal: true

module Payroc
  module Types
    class SingleUseTokenPayloadPinDetails < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :data_format

      member -> { Payroc::Types::DukptPinDetails }, key: "DUKPT"
      member -> { Payroc::Types::RawPinDetails }, key: "RAW"
    end
  end
end
