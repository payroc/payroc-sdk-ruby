# frozen_string_literal: true

module Payroc
  module Payments
    module PaymentLinks
      module Types
        class CreatePaymentLinksRequest < Internal::Types::Model
          field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Payroc::Payments::PaymentLinks::Types::CreatePaymentLinksRequestBody }, optional: false, nullable: false
        end
      end
    end
  end
end
