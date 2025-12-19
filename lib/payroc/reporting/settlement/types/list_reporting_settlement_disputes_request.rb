# frozen_string_literal: true

module Payroc
  module Reporting
    module Settlement
      module Types
        class ListReportingSettlementDisputesRequest < Internal::Types::Model
          field :before, -> { String }, optional: true, nullable: false
          field :after, -> { String }, optional: true, nullable: false
          field :limit, -> { Integer }, optional: true, nullable: false
          field :date, -> { String }, optional: false, nullable: false
          field :merchant_id, -> { String }, optional: true, nullable: false, api_name: "merchantId"
        end
      end
    end
  end
end
