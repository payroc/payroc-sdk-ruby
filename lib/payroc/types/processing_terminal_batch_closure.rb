# frozen_string_literal: true

module Payroc
  module Types
    # Polymorphic object that contains information about when and how the terminal closes the batch.
    #
    # The value of the batchCloseType field determines which variant you should use:
    # -	`automatic` - Terminal automatically closes the batch at a specific time each day.
    # - `manual` - Merchant uses the terminal to manually close the batch.
    class ProcessingTerminalBatchClosure < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :batch_close_type

      member -> { Payroc::Types::SchemasAutomaticBatchClose }, key: "AUTOMATIC"
      member -> { Payroc::Types::SchemasManualBatchClose }, key: "MANUAL"
    end
  end
end
