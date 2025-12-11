# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the application settings for the solution.
    class ProcessingTerminalApplicationSettings < Internal::Types::Model
      field :invoice_number_prompt, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "invoiceNumberPrompt"
      field :clerk_prompt, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "clerkPrompt"
    end
  end
end
