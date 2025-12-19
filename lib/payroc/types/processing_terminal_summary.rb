# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the processing terminal.
    class ProcessingTerminalSummary < Internal::Types::Model
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :link, -> { Payroc::Types::ProcessingTerminalSummaryLink }, optional: false, nullable: false
    end
  end
end
