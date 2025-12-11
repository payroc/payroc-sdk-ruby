# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the terminal's host configuration.
    class HostConfiguration < Internal::Types::Model
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :processing_account_id, -> { String }, optional: true, nullable: false, api_name: "processingAccountId"
      field :configuration, -> { Payroc::Types::HostConfigurationConfiguration }, optional: false, nullable: false
    end
  end
end
