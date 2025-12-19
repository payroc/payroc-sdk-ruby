# frozen_string_literal: true

module Payroc
  module Funding
    module FundingRecipients
      module Types
        class CreateOwnerFundingRecipientsRequest < Internal::Types::Model
          field :recipient_id, -> { Integer }, optional: false, nullable: false, api_name: "recipientId"
          field :idempotency_key, -> { String }, optional: false, nullable: false, api_name: "Idempotency-Key"
          field :body, -> { Payroc::Types::Owner }, optional: false, nullable: false
        end
      end
    end
  end
end
