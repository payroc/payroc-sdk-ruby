# frozen_string_literal: true

module Payroc
  module Types
    module FundingAccountStatus
      extend Payroc::Internal::Types::Enum

      APPROVED = "approved"
      REJECTED = "rejected"
      PENDING = "pending"
      HOLD = "hold"
    end
  end
end
