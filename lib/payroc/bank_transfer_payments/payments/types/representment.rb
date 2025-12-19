# frozen_string_literal: true

module Payroc
  module BankTransferPayments
    module Payments
      module Types
        class Representment < Internal::Types::Model
          field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :payment_method, -> { Payroc::BankTransferPayments::Payments::Types::RepresentmentPaymentMethod }, optional: true, nullable: false, api_name: "paymentMethod"
        end
      end
    end
  end
end
