# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the gateway settings for the solution.
    class PayrocGateway < Internal::Types::Model
      field :gateway, -> { Payroc::Types::PayrocGatewayGateway }, optional: false, nullable: false
      field :terminal_template_id, -> { String }, optional: false, nullable: false, api_name: "terminalTemplateId"
    end
  end
end
