# frozen_string_literal: true

module Payroc
  module Types
    class SingleUseToken < Internal::Types::Model
      field :processing_terminal_id, -> { String }, optional: true, nullable: false, api_name: "processingTerminalId"
      field :operator, -> { String }, optional: true, nullable: false
      field :payment_method, -> { Payroc::Types::SingleUseTokenPaymentMethod }, optional: true, nullable: false, api_name: "paymentMethod"
      field :token, -> { String }, optional: true, nullable: false
      field :expires_at, -> { String }, optional: true, nullable: false, api_name: "expiresAt"
      field :source, -> { Payroc::Types::SingleUseTokenSource }, optional: false, nullable: false
    end
  end
end
