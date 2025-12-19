# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the initial payment for the payment instruction.
    class FirstTxnReferenceData < Internal::Types::Model
      field :payment_id, -> { String }, optional: true, nullable: false, api_name: "paymentId"
      field :card_scheme_reference_id, -> { String }, optional: true, nullable: false, api_name: "cardSchemeReferenceId"
    end
  end
end
