# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains up to three tip amounts that the terminal displays during a sale.
    class TipProcessingEnabledSuggestedTips < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: true, nullable: false
      field :tip_percentages, -> { Internal::Types::Array[String] }, optional: true, nullable: false, api_name: "tipPercentages"
    end
  end
end
