# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class ListReportingSettlementAuthorizationsRequest < Internal::Types::Model
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :date, -> { String }, optional: true, nullable: false
          field :batch_id, -> { Integer }, optional: true, nullable: false, api_name: "batchId"
          field :merchant_id, -> { String }, optional: true, nullable: false, api_name: "merchantId"
        end
      end
    end
  end
end
