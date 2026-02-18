# frozen_string_literal: true

module Payroc
  module Attachments
    module Types
      # Object that contains details about the attachment.
      class UploadToProcessingAccountAttachmentsRequestAttachment < Internal::Types::Model
        field :type, -> { Payroc::Attachments::Types::UploadToProcessingAccountAttachmentsRequestAttachmentType }, optional: false, nullable: false
        field :description, -> { String }, optional: true, nullable: false
        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      end
    end
  end
end
