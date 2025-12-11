# frozen_string_literal: true

module Payroc
  module Payments
    module BankTransferPayments
      module Types
        class Representment < Internal::Types::Model
          field :payment_id, -> { String }, optional: false, nullable: false, api_name: "paymentId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :payment_method, -> { Payroc::Payments::BankTransferPayments::Types::RepresentmentPaymentMethod }, optional: true, nullable: false, api_name: "paymentMethod"
        end
      end
    end
  end
end
