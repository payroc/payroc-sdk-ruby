# frozen_string_literal: true

module Payroc
  module Types
    module ActivityRecordType
      extend Payroc::Internal::Types::Enum

      CREDIT = "credit"
      DEBIT = "debit"
    end
  end
end
