# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the configuration settings for the terminal.
    class TsysTerminal < Internal::Types::Model
      field :terminal_id, -> { String }, optional: false, nullable: false, api_name: "terminalId"
      field :terminal_number, -> { String }, optional: false, nullable: false, api_name: "terminalNumber"
      field :authentication_code, -> { String }, optional: true, nullable: false, api_name: "authenticationCode"
      field :sharing_groups, -> { String }, optional: true, nullable: false, api_name: "sharingGroups"
      field :moto_allowed, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "motoAllowed"
      field :internet_allowed, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "internetAllowed"
      field :card_present_allowed, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "cardPresentAllowed"
    end
  end
end
