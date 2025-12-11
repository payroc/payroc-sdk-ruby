# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the 3-D Secure information from a third party.
    class ThirdPartyThreeDSecure < Internal::Types::Model
      field :eci, -> { Payroc::Types::ThirdPartyThreeDSecureEci }, optional: false, nullable: false
      field :xid, -> { String }, optional: true, nullable: false
      field :cavv, -> { String }, optional: true, nullable: false
      field :ds_transaction_id, -> { String }, optional: true, nullable: false, api_name: "dsTransactionId"
    end
  end
end
