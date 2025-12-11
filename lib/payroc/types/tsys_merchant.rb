# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the configuration settings for the merchant.
    class TsysMerchant < Internal::Types::Model
      field :pos_mid, -> { String }, optional: false, nullable: false, api_name: "posMid"
      field :chain_number, -> { String }, optional: false, nullable: false, api_name: "chainNumber"
      field :settlement_agent, -> { String }, optional: true, nullable: false, api_name: "settlementAgent"
      field :aba_number, -> { String }, optional: true, nullable: false, api_name: "abaNumber"
      field :bin_number, -> { String }, optional: false, nullable: false, api_name: "binNumber"
      field :agent_bank_number, -> { String }, optional: true, nullable: false, api_name: "agentBankNumber"
      field :reimbursement_attribute, -> { String }, optional: true, nullable: false, api_name: "reimbursementAttribute"
      field :location_number, -> { String }, optional: true, nullable: false, api_name: "locationNumber"
    end
  end
end
