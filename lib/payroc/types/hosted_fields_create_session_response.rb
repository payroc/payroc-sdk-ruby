# frozen_string_literal: true

module Payroc
  module Types
    class HostedFieldsCreateSessionResponse < Internal::Types::Model
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :token, -> { String }, optional: false, nullable: false
      field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
    end
  end
end
