# frozen_string_literal: true

module Payroc
  module Types
    module MerchantPlatformProcessingAccountsItemStatus
      extend Payroc::Internal::Types::Enum

      ENTERED = "entered"
      PENDING = "pending"
      APPROVED = "approved"
      SUBJECT_TO = "subjectTo"
      DORMANT = "dormant"
      NON_PROCESSING = "nonProcessing"
      REJECTED = "rejected"
      TERMINATED = "terminated"
      CANCELLED = "cancelled"
      FAILED = "failed"
    end
  end
end
