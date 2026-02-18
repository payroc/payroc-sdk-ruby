# frozen_string_literal: true

module Payroc
  module Attachments
    module Types
      class RetrieveAttachmentsRequest < Internal::Types::Model
        field :attachment_id, -> { String }, optional: false, nullable: false, api_name: "attachmentId"
      end
    end
  end
end
