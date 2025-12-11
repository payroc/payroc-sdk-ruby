# frozen_string_literal: true

module Payroc
  module Boarding
    module ProcessingAccounts
      module Types
        class ListProcessingAccountOwnersRequest < Internal::Types::Model
          field :processing_account_id, -> { String }, optional: false, nullable: false, api_name: "processingAccountId"
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
        end
      end
    end
  end
end
