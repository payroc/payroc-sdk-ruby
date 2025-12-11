# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        class CreateTerminalOrder < Internal::Types::Model
          field :processing_account_id, -> { String }, optional: false, nullable: false, api_name: "processingAccountId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :training_provider, -> { Payroc::Types::TrainingProvider }, optional: true, nullable: false, api_name: "trainingProvider"
          field :shipping, -> { Payroc::Boarding::ProcessingAccounts::Types::CreateTerminalOrderShipping }, optional: true, nullable: false
          field :order_items, -> { Internal::Types::Array[Payroc::Types::OrderItem] }, optional: false, nullable: false, api_name: "orderItems"
        end
      end
    end
  end
end
