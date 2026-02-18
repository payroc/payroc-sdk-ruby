# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains information about a customer's PIN.
    #
    # The value of the dataFormat parameter determines which variant you should use:
    # - `dukpt` - PIN information is encrypted.
    # - `raw` - PIN information is unencrypted.
    class SingleUseTokenPayloadPinDetails < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :data_format

      member -> { Payroc::Types::DukptPinDetails }, key: "DUKPT"
      member -> { Payroc::Types::RawPinDetails }, key: "RAW"
    end
  end
end
