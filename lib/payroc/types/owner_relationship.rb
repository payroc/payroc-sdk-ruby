# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the owner's relationship to the business.
    class OwnerRelationship < Internal::Types::Model
      field :equity_percentage, -> { Integer }, optional: true, nullable: false, api_name: "equityPercentage"
      field :title, -> { String }, optional: true, nullable: false
      field :is_control_prong, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "isControlProng"
      field :is_authorized_signatory, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "isAuthorizedSignatory"
    end
  end
end
