# frozen_string_literal: true

module Payroc
  module Types
    # Object that includes information about how we captured the owner's signature.
    class Signature < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::SignatureByDirectLink }, key: "REQUESTED_VIA_DIRECT_LINK"
      member -> { Payroc::Types::SignatureByEmail }, key: "REQUESTED_VIA_EMAIL"
    end
  end
end
