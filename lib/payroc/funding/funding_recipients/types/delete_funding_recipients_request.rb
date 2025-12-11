# frozen_string_literal: true

module Payroc
  module Funding
    module FundingRecipients
      module Types
        class DeleteFundingRecipientsRequest < Internal::Types::Model
          field :recipient_id, -> { Integer }, optional: false, nullable: false, api_name: "recipientId"
        end
      end
    end
  end
end
