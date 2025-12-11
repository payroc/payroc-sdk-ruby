# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the settlement.
    class SettledSummary < Internal::Types::Model
      field :settled_by, -> { String }, optional: true, nullable: false, api_name: "settledBy"
      field :ach_date, -> { String }, optional: true, nullable: false, api_name: "achDate"
      field :ach_deposit_id, -> { Integer }, optional: true, nullable: false, api_name: "achDepositId"
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
