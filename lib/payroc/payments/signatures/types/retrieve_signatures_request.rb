# frozen_string_literal: true

module Payroc
  module Payments
    module Signatures
      module Types
        class RetrieveSignaturesRequest < Internal::Types::Model
          field :signature_id, -> { String }, optional: false, nullable: false, api_name: "signatureId"
        end
      end
    end
  end
end
