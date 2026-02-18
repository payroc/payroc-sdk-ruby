# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains information about how we captured the owner's signature.
    #
    # The value of the type parameter determines which variant you should use:
    # -	`requestedViaDirectLink` - Request signature using a link.
    # -	`requestedViaEmail` - Request signature by email.
    class Signature < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::SignatureByDirectLink }, key: "REQUESTED_VIA_DIRECT_LINK"
      member -> { Payroc::Types::SignatureByEmail }, key: "REQUESTED_VIA_EMAIL"
    end
  end
end
