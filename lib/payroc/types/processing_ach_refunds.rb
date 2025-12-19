# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the ACH refund policy for the processing account.
    class ProcessingAchRefunds < Internal::Types::Model
      field :written_refund_policy, -> { Internal::Types::Boolean }, optional: false, nullable: false, api_name: "writtenRefundPolicy"
      field :refund_policy_url, -> { String }, optional: true, nullable: false, api_name: "refundPolicyUrl"
    end
  end
end
