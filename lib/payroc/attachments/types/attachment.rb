# frozen_string_literal: true

module Payroc
  module Attachments
    module Types
      class Attachment < Internal::Types::Model
        field :attachment_id, -> { String }, optional: false, nullable: false, api_name: "attachmentId"
        field :type, -> { Payroc::Attachments::Types::AttachmentType }, optional: false, nullable: false
        field :upload_status, -> { Payroc::Attachments::Types::AttachmentUploadStatus }, optional: false, nullable: false, api_name: "uploadStatus"
        field :file_name, -> { String }, optional: false, nullable: false, api_name: "fileName"
        field :content_type, -> { String }, optional: false, nullable: false, api_name: "contentType"
        field :description, -> { String }, optional: true, nullable: false
        field :entity, -> { Payroc::Attachments::Types::AttachmentEntity }, optional: false, nullable: false
        field :created_date, -> { String }, optional: false, nullable: false, api_name: "createdDate"
        field :last_modified_date, -> { String }, optional: false, nullable: false, api_name: "lastModifiedDate"
        field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
      end
    end
  end
end
