# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingTerminals
      module Types
        class RetrieveProcessingTerminalsRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
        end
      end
    end
  end
end
