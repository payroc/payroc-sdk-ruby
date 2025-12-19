# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the application settings for the solution.
    class OrderItemSolutionSetupApplicationSettings < Internal::Types::Model
      field :clerk_prompt, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "clerkPrompt"
      field :security, -> { Payroc::Types::OrderItemSolutionSetupApplicationSettingsSecurity }, optional: true, nullable: false
    end
  end
end
