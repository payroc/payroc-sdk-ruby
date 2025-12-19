# frozen_string_literal: true

module Payroc
  module Funding
    module FundingRecipients
      module Types
        class UpdateFundingRecipientsRequest < Internal::Types::Model
          field :recipient_id, -> { Integer }, optional: false, nullable: false, api_name: "recipientId"
          field :body, -> { Payroc::Types::FundingRecipient }, optional: false, nullable: false
        end
      end
    end
  end
end
