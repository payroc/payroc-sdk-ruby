# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains details about payment links.
    class ProcessingTerminalFeaturesPaymentLinks < Internal::Types::Model
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :logo_url, -> { String }, optional: true, nullable: false, api_name: "logoUrl"
      field :footer_notes, -> { String }, optional: true, nullable: false, api_name: "footerNotes"
    end
  end
end
