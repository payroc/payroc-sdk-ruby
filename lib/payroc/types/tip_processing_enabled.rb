# frozen_string_literal: true

module Payroc
  module Types
    # Tip settings
    class TipProcessingEnabled < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :tip_prompt, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "tipPrompt"
      field :tip_adjust, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "tipAdjust"
      field :suggested_tips, -> { Payroc::Types::TipProcessingEnabledSuggestedTips }, optional: true, nullable: false, api_name: "suggestedTips"
    end
  end
end
