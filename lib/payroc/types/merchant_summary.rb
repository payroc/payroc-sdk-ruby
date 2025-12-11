# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the merchant.
    class MerchantSummary < Internal::Types::Model
      field :merchant_id, -> { String }, optional: true, nullable: false, api_name: "merchantId"
      field :doing_business_as, -> { String }, optional: true, nullable: false, api_name: "doingBusinessAs"
      field :processing_account_id, -> { Integer }, optional: true, nullable: false, api_name: "processingAccountId"
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
