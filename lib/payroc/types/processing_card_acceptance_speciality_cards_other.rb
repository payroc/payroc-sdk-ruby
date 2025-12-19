# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about other speciality cards that the merchant accepts.
    class ProcessingCardAcceptanceSpecialityCardsOther < Internal::Types::Model
      field :wex_merchant_number, -> { String }, optional: true, nullable: false, api_name: "wexMerchantNumber"
      field :voyager_merchant_id, -> { String }, optional: true, nullable: false, api_name: "voyagerMerchantId"
      field :fleet_merchant_id, -> { String }, optional: true, nullable: false, api_name: "fleetMerchantId"
    end
  end
end
