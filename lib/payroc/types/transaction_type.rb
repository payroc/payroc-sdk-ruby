# frozen_string_literal: true

module Payroc
  module Types
    module TransactionType
      extend Payroc::Internal::Types::Enum

      CAPTURE = "capture"
      RETURN = "return"
    end
  end
end
