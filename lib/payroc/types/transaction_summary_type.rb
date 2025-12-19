# frozen_string_literal: true

module Payroc
  module Types
    module TransactionSummaryType
      extend Payroc::Internal::Types::Enum

      CAPTURE = "capture"
      RETURN = "return"
    end
  end
end
