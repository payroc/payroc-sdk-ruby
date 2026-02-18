# frozen_string_literal: true

module Payroc
  module Attachments
    module Types
      class UploadAttachment < Internal::Types::Model
        field :processing_account_id, -> { String }, optional: false, nullable: false, api_name: "processingAccountId"
        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
      end
    end
  end
end
