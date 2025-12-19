# frozen_string_literal: true

module Payroc
  module Types
    module FundingRecipientStatus
      extend Payroc::Internal::Types::Enum

      APPROVED = "approved"
      REJECTED = "rejected"
      PENDING = "pending"
    end
  end
end
