# frozen_string_literal: true

module Payroc
  module Types
    class Balance < Internal::Types::Model
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :operator, -> { String }, optional: true, nullable: false
      field :card, -> { Payroc::Types::Card }, optional: false, nullable: false
      field :response_code, -> { Payroc::Types::BalanceResponseCode }, optional: true, nullable: false, api_name: "responseCode"
      field :response_message, -> { String }, optional: true, nullable: false, api_name: "responseMessage"
    end
  end
end
