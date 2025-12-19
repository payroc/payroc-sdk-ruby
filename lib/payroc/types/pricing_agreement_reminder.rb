# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the pricing agreement reminder.
    class PricingAgreementReminder < Internal::Types::Model
      field :reminder_id, -> { String }, optional: true, nullable: false, api_name: "reminderId"
    end
  end
end
