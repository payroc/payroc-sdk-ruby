# frozen_string_literal: true

module Payroc
  module Payments
    module Signatures
      module Types
        class RetrieveSignaturesResponse < Internal::Types::Model
          field :signature_id, -> { String }, optional: true, nullable: false, api_name: "signatureId"
          field :processing_terminal_id, -> { String }, optional: true, nullable: false, api_name: "processingTerminalId"
          field :created_on, -> { String }, optional: true, nullable: false, api_name: "createdOn"
          field :content_type, -> { String }, optional: true, nullable: false, api_name: "contentType"
          field :signature, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
