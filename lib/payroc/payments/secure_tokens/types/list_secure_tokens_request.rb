# frozen_string_literal: true

module Payroc
  module Payments
    module SecureTokens
      module Types
        class ListSecureTokensRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :secure_token_id, -> { String }, optional: true, nullable: false, api_name: "secureTokenId"
          field :customer_name, -> { String }, optional: true, nullable: false, api_name: "customerName"
          field :phone, -> { String }, optional: true, nullable: false
          field :email, -> { String }, optional: true, nullable: false
          field :token, -> { String }, optional: true, nullable: false
          field :first_6, -> { String }, optional: true, nullable: false, api_name: "first6"
          field :last_4, -> { String }, optional: true, nullable: false, api_name: "last4"
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
