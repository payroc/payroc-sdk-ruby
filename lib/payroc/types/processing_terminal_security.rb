# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the tokenization settings and AVS settings for the terminal.
    class ProcessingTerminalSecurity < Internal::Types::Model
      field :tokenization, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :avs_prompt, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "avsPrompt"
      field :avs_level, -> { Payroc::Types::ProcessingTerminalSecurityAvsLevel }, optional: true, nullable: false, api_name: "avsLevel"
      field :cvv_prompt, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "cvvPrompt"
    end
  end
end
