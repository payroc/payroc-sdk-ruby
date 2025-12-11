# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about when and how the terminal closes the batch.
    class OrderItemSolutionSetupBatchClosure < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :batch_close_type

      member -> { Payroc::Types::AutomaticBatchClose }, key: "AUTOMATIC"
      member -> { Payroc::Types::ManualBatchClose }, key: "MANUAL"
    end
  end
end
