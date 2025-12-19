# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about when and how the terminal closes the batch.
    class ProcessingTerminalBatchClosure < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :batch_close_type

      member -> { Payroc::Types::SchemasAutomaticBatchClose }, key: "AUTOMATIC"
      member -> { Payroc::Types::SchemasManualBatchClose }, key: "MANUAL"
    end
  end
end
