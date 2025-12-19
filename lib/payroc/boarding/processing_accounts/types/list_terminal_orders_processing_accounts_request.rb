# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        class ListTerminalOrdersProcessingAccountsRequest < Internal::Types::Model
          field :processing_account_id, -> { String }, optional: false, nullable: false, api_name: "processingAccountId"
          field :status, -> { Payroc::Boarding::ProcessingAccounts::Types::ListTerminalOrdersProcessingAccountsRequestStatus }, optional: true, nullable: false
          field :from_date_time, -> { String }, optional: true, nullable: false, api_name: "fromDateTime"
          field :to_date_time, -> { String }, optional: true, nullable: false, api_name: "toDateTime"
        end
      end
    end
  end
end
