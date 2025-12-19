# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the gateway settings for the solution.
    class OrderItemSolutionSetupGatewaySettings < Internal::Types::Model
      field :merchant_portfolio_id, -> { String }, optional: true, nullable: false, api_name: "merchantPortfolioId"
      field :merchant_template_id, -> { String }, optional: true, nullable: false, api_name: "merchantTemplateId"
      field :user_template_id, -> { String }, optional: true, nullable: false, api_name: "userTemplateId"
      field :terminal_template_id, -> { String }, optional: true, nullable: false, api_name: "terminalTemplateId"
    end
  end
end
