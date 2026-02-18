# frozen_string_literal: true

module Payroc
  module Attachments
    module Types
      # Object that contains information about the entity that the attachment is linked to.
      class AttachmentEntity < Internal::Types::Model
        field :type, -> { Payroc::Attachments::Types::AttachmentEntityType }, optional: false, nullable: false
        field :id, -> { String }, optional: false, nullable: false
      end
    end
  end
end
