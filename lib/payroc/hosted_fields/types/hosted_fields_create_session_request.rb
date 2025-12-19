# frozen_string_literal: true

module Payroc
  module HostedFields
    module Types
      class HostedFieldsCreateSessionRequest < Internal::Types::Model
        field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
        field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
        field :lib_version, -> { String }, optional: false, nullable: false, api_name: "libVersion"
        field :scenario, -> { Payroc::HostedFields::Types::HostedFieldsCreateSessionRequestScenario }, optional: false, nullable: false
        field :secure_token_id, -> { String }, optional: true, nullable: false, api_name: "secureTokenId"
      end
    end
  end
end
