# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        class CreateReminderProcessingAccountsRequest < Internal::Types::Model
          field :processing_account_id, -> { String }, optional: false, nullable: false, api_name: "processingAccountId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Payroc::Boarding::ProcessingAccounts::Types::CreateReminderProcessingAccountsRequestBody }, optional: false, nullable: false
        end
      end
    end
  end
end
