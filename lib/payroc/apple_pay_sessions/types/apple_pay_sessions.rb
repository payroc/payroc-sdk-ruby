# frozen_string_literal: true

module Payroc
  module ApplePaySessions
    module Types
      class ApplePaySessions < Internal::Types::Model
        field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
        field :apple_domain_id, -> { String }, optional: false, nullable: false, api_name: "appleDomainId"
        field :apple_validation_url, -> { String }, optional: false, nullable: false, api_name: "appleValidationUrl"
      end
    end
  end
end
