# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the signature for the transaction.
    # **Note:** If the merchant previously added a signature to the transaction, they can’t adjust or delete the
    # signature.
    class SignatureAdjustment < Internal::Types::Model
      field :cardholder_signature, -> { String }, optional: false, nullable: false, api_name: "cardholderSignature"
    end
  end
end
