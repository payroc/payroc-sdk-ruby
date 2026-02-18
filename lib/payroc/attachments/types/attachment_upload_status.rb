# frozen_string_literal: true

module Payroc
  module Attachments
    module Types
      module AttachmentUploadStatus
        extend Payroc::Internal::Types::Enum

        PENDING = "pending"
        ACCEPTED = "accepted"
        REJECTED = "rejected"
      end
    end
  end
end
