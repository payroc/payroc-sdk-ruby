# frozen_string_literal: true

module Payroc
  module Types
    class BankAccountVerificationResult < Internal::Types::Model
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :verified, -> { Internal::Types::Boolean }, optional: false, nullable: false
    end
  end
end
