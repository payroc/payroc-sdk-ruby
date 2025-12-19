# frozen_string_literal: true

module Payroc
  module Types
    # Object that indicates if the customer's card is eligible for Dynamic Currency Conversion (DCC).
    class FxRateInquiryResult < Internal::Types::Model
      field :dcc_offered, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "dccOffered"
      field :cause_of_rejection, -> { String }, optional: true, nullable: false, api_name: "causeOfRejection"
    end
  end
end
